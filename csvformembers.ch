#!/bin/bash
git clone https://github.com/johnxandr/CurieTeam-HB.git
cd CurireTeam-HB

echo "Running compilers for C and C++"
ls *.c| parallel gcc -o {.}.c-program {};
ls *.cpp| parallel g++ -o {.}.cpp-program {};

echo "Time for main scripts"
echo "Name,email,slack_username,biostack">>CurieTeam-HB.csv
ls *.py|parallel "python3 {} |awk -F': ' ' {print \$0}' |paste -sd ',' >>CurieTeam-HB.csv"
ls *.pl|parallel "Perl {} |awk -F': ' ' {print \$0}' |paste -sd ','>>CurieTeam-HB.csv"
ls *.R|parallel "Rscript {} |awk -F': ' ' {print \$0}'|paste -sd  ','>>CurieTeam-HB.csv"
ls *.cpp-program|parallel "./{} |awk -F': ' ' {print \$0}' |paste -sd ','>>CurieTeam-HB.csv"

echo "Removing the temporary c files"
rm  *.cpp-program
rm  *.c-program

echo "Go CurieTeam-HB!"
