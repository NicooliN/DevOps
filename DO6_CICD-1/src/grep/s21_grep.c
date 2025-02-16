
#include "s21_grep.h"

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
  args arg = arg_parser(argc, argv);
  file_output(arg, argc, argv);
  return 0;
}

args arg_parser(int argc, char* argv[]) {
  args arg = {0};
  char short_opts[] = "e:ivclnhsf:o";
  int opt;
  while ((opt = getopt(argc, argv, short_opts)) != -1) {
    set_opt(&arg, opt);
  }
  if (arg.len_patrn == 0) {
    add_patrn(&arg, argv[optind]);
    optind++;
  }
  if (argc - optind == 1) {
    arg.h = 1;
  }
  return arg;
}

void file_output(args arg, int argc, char* argv[]) {
  regex_t reg;
  int error = regcomp(&reg, arg.patrn, REG_EXTENDED | arg.i);
  if (error) perror("Regex Error");
  for (int i = optind; i < argc; i++) {
    process_file(arg, argv[i], &reg);
  }
  regfree(&reg);
}

void add_reg_file(args* arg, char* path) {
  FILE* file = fopen(path, "r");
  if (file == NULL) {
    if (!arg->s) perror(path);
    exit(1);
  }
  char* line = NULL;
  size_t memline = 0;
  int read = getline(&line, &memline, file);

  while (read != -1) {
    if (line[read - 1] == '\n') line[read - 1] = '\0';
    add_patrn(arg, line);
    read = getline(&line, &memline, file);
  }
  free(line);

  fclose(file);
}

void add_patrn(args* arg, char* patrn) {
  if (arg->len_patrn != 0) {
    strcat(arg->patrn + arg->len_patrn, "|");
    arg->len_patrn++;
  }
  arg->len_patrn += sprintf(arg->patrn + arg->len_patrn, "(%s)", patrn);
}

void set_opt(args* arg, char opt) {
  switch (opt) {
    case 'e':
      arg->e = 1;
      add_patrn(arg, optarg);
      break;
    case 'i':
      arg->i = REG_ICASE;
      break;
    case 'v':
      arg->v = 1;
      break;
    case 'c':
      arg->c = 1;
      break;
    case 'l':
      arg->l = 1;
      break;
    case 'n':
      arg->n = 1;
      break;
    case 'h':
      arg->h = 1;
      break;
    case 's':
      arg->s = 1;
      break;
    case 'f':
      arg->f = 1;
      add_reg_file(arg, optarg);
      break;
    case 'o':
      arg->o = 1;
      break;
    case '?':
      perror("Argumet Error");
      exit(1);
      break;
    default:
      printf(
          "grep: option requires an argument -- %c\nUsage: grep [OPTION]... "
          "PATTERNS [FILE]...\nTry 'grep --help' for more information.",
          opt);
      exit(1);
      break;
  }
}

void print_line(char* line, int n) {
  for (int i = 0; i < n; i++) {
    putchar(line[i]);
  }
  if (line[n - 1] != '\n') putchar('\n');
}

void print_line_for_o(regex_t* reg, char* line) {
  regmatch_t match;
  int offset = 0;
  while (1) {
    int res = regexec(reg, line + offset, 1, &match, 0);
    if (res != 0) {
      break;
    }
    for (int i = match.rm_so; i < match.rm_eo; i++) {
      putchar(line[i]);
    }
    putchar('\n');
    offset += match.rm_eo;
  }
}

void process_file(args arg, char* path, regex_t* reg) {
  FILE* file = fopen(path, "r");
  if (file == NULL) {
    if (!arg.s) perror(path);
    exit(1);
  }
  char* line = NULL;
  size_t memline = 0;

  int line_number = 1;
  int line_match = 0;
  int read = getline(&line, &memline, file);
  while (read != -1) {
    int res = regexec(reg, line, 0, NULL, 0);
    if ((res == 0 && !arg.v) || (arg.v && res != 0)) {
      if (!arg.c && !arg.l) {
        if (!arg.h) printf("%s:", path);
        if (arg.n) printf("%d:", line_number);
        if (arg.o) {
          print_line_for_o(reg, line);
        } else {
          print_line(line, read);
        }
      }
      line_match++;
    }
    read = getline(&line, &memline, file);
    line_number++;
  }
  if (arg.c && !arg.l) {
    if (!arg.h) printf("%s:", path);
    printf("%d\n", line_match);  ////////////////////
  }
  if (arg.l && line_match > 0) printf("%s\n", path);

  free(line);
  fclose(file);
}
