#ifndef S21_GREP_H
#define S21_GREP_H

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_LEN 256

typedef struct args {
  int e, i, v, c, l, n, h, s, f, o;
  char patrn[MAX_LEN];
  int len_patrn;
  // int len_memloc;
} args;

void print_line(char* line, int n);
args arg_parser(int argc, char* argv[]);
void set_opt(args* arg, char opt);
char disp_nonprint_v(char ch);
void file_output(args arg, int argc, char* argv[]);
void process_file(args arg, char* path, regex_t* reg);
void add_patrn(args* arg, char* patrn);
void add_reg_file(args* arg, char* path);
void print_line_for_o(regex_t* reg, char* line);
#endif