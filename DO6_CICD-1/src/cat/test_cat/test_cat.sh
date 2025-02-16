#!/bin/bash

diff <(../s21_cat test.txt) <(cat test.txt) 
diff <(../s21_cat -e test.txt) <(cat -e test.txt) 

diff <(../s21_cat -t  test.txt) <(cat -t  test.txt) 

diff <(../s21_cat -s  test.txt) <(cat -s  test.txt) 
diff <(../s21_cat --squeeze-blank test.txt) <(cat --squeeze-blank test.txt) 
diff <(../s21_cat -n  test.txt) <(cat -n test.txt) 
diff <(../s21_cat --number test.txt) <(cat --number test.txt) 
diff <(../s21_cat -b test.txt) <(cat -b test.txt) 
diff <(../s21_cat --number-nonblank test.txt) <(cat --number-nonblank test.txt) 

diff <(../s21_cat -e test.txt) <(cat -e -v test.txt) 
diff <(../s21_cat -t  test.txt) <(cat -vt  test.txt) 
diff <(../s21_cat -esnb  test.txt) <(cat -evsnb  test.txt) 

echo test cat SUCSSES
