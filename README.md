#Bash Grading Tool
##Motivation
Grading labs can be a repetitive and time consuming task and some ports of it can be optimized reducing amount of time and energy.
##Usage
Right now to use this tool you need to create a new folder containing folders with student names. Inside it put .c fils
''' LAB -> STUDENT_NAME -> FILES_TO_GRADE '''

After create directory with sample outputs.
Then call grade.sh specifying LAB directory and SAMPLE directory
'''bash grade.sh LAB SAMPLE '''

Script will create directory in format LAB_PROCESSED that will contain directories named STUDENT_NAME.
These directories will contain log file containing result of script.
Also it will contain 2 directories:
    OUTPUT
    MANUAL
OUTPUT - contains result of compilation in a form FILE_NAME.txt
MANUAL - contains files that are not specified in SAMPLE or files that result on compilation error

##MISC
generate_text is a tool that can generate directories for testing

You can test script by running 
'''bash grade.sh testLab samples'''