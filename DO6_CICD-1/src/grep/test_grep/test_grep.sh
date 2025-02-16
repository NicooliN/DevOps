#!/bin/bash

diff <(../s21_grep main s21_grep.txt) <(grep main s21_grep.txt) 
diff <(../s21_grep -v main s21_grep.txt) <(grep -v main s21_grep.txt) 
diff <(../s21_grep -i regex s21_grep.txt) <(grep -i regex s21_grep.txt) 
diff <(../s21_grep -iv regex s21_grep.txt) <(grep -iv regex s21_grep.txt) 
diff <(../s21_grep -in regex s21_grep.txt) <(grep -in regex s21_grep.txt) 
diff <(../s21_grep -in regex s21_grep.txt) <(grep -in regex s21_grep.txt) 
diff <(../s21_grep -in regex s21_grep.txt) <(grep -in regex s21_grep.txt) 

diff <(../s21_grep -o regex s21_grep.txt) <(grep -o regex s21_grep.txt) 
diff <(../s21_grep -oi regex s21_grep.txt) <(grep -oi regex s21_grep.txt) 
diff <(../s21_grep -oin regex s21_grep.txt) <(grep -oin regex s21_grep.txt) 

diff <(../s21_grep -f in_test_f.txt s21_grep.txt) <(grep -f in_test_f.txt s21_grep.txt) 
diff <(../s21_grep -of in_test_f.txt s21_grep.txt) <(grep -of in_test_f.txt s21_grep.txt) 
diff <(../s21_grep -onf in_test_f.txt s21_grep.txt) <(grep -onf in_test_f.txt s21_grep.txt) 

echo test grep SUCSSES