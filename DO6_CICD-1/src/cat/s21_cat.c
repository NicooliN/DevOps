#include "s21_cat.h"

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
  args arg = arg_parser(argc, argv);
  while (optind < argc) {
    print_file(&arg, argv[optind++]);
  }
  return 0;
}

void print_file(args* arg, char* path) {
  FILE* file = fopen(path, "r");
  char* line = NULL;
  size_t memline = 0;
  int read = 0;
  int line_number = 1;
  int empty_line = 0;
  read = getline(&line, &memline, file);
  while (read != -1) {
    if (arg->s && line[0] == '\n') {
      ++empty_line;
    } else
      empty_line = 0;
    if (empty_line > 1) {
      read = getline(&line, &memline, file);
      continue;
    } else {
      print_line(arg, line, read, &line_number);
      read = getline(&line, &memline, file);
    }
  }
  free(line);
  fclose(file);
}

void print_line(args* arg, char* line, int n, int* line_number) {
  if (arg->n || arg->b) {
    if (arg->b && line[0] != '\n') {
      printf("%6d\t", *line_number);
      *line_number += 1;
    } else if (arg->n && !arg->b) {
      printf("%6d\t", *line_number);
      *line_number += 1;
    }
  }

  for (int i = 0; i < n; i++) {
    if (arg->T && line[i] == '\t')
      printf("^I");
    else {
      if (arg->E && line[i] == '\n') putchar('$');
      if (arg->v) line[i] = disp_nonprint_v(line[i]);
      putchar(line[i]);
    }
  }
}

char disp_nonprint_v(char symbol) {
  if (symbol == '\n') {
    symbol = '\n';
  } else if (symbol == '\t') {
    symbol = '\t';
  } else if (symbol <= 31) {
    putchar('^');
    symbol += 64;
  } else if (symbol == 127) {
    putchar('^');
    symbol = '?';
  }
  return symbol;
}

args arg_parser(int argc, char* argv[]) {
  args arg = {0, 0, 0, 0, 0, 0};
  char short_opts[] = "beEvnstT";
  struct option long_opts[] = {{"number-nonblank", no_argument, NULL, 'b'},
                               {"number", no_argument, NULL, 'n'},
                               {"squeeze-blank", no_argument, NULL, 's'},
                               {NULL, 0, NULL, 0}};

  int opt;
  opt = getopt_long(argc, argv, short_opts, long_opts, NULL);
  while (opt != -1) {
    set_opt(&arg, opt);
    opt = getopt_long(argc, argv, short_opts, long_opts, NULL);
  }
  return arg;
}

void set_opt(args* arg, int opt) {
  switch (opt) {
    case 'b':
      arg->b = 1;
      break;
    case 'e':
      arg->E = 1;
      arg->v = 1;
      break;
    case 'v':
      arg->v = 1;
      break;
    case 'E':
      arg->E = 1;
      break;
    case 'n':
      arg->n = 1;
      break;
    case 's':
      arg->s = 1;
      break;
    case 't':
      arg->T = 1;
      arg->v = 1;
      break;
    case 'T':
      arg->T = 1;
      break;
    case '?':
      perror("Argumet Error");
      exit(1);
      break;
    default:
      printf(
          "cat: invalid option --  %c\nTry 'cat --help' for more information.",
          opt);
      exit(1);
      break;
  }
}
