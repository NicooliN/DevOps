
#ifndef S21_CAT_H
#define S21_CAT_H

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct args {
  int b, E, v, n, s, T;
} args;

void print_line(args* arg, char* line, int n, int* line_number);
args arg_parser(int argc, char* argv[]);
void set_opt(args* arg, int opt);
char disp_nonprint_v(char ch);
void print_file(args* arg, char* path);

#endif
