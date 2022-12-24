BASE=$1
PROCESSED="$1_PROCESSED"
SAMPLEPATH="$2"
mkdir -p $PROCESSED

SAMPLE_LIST=$(ls $2)

for DIR in $BASE/*; do
    STUDENT_NAME=$(basename $DIR)
    CFILES=$(find $DIR -name "*.c")
    STUDENT_DIRECTORY="$PROCESSED/$STUDENT_NAME"
    mkdir -p $STUDENT_DIRECTORY
    COMPILED=$'Compiled correctly:\n'
    INTRUDERS=$'Compiled incorrectly or not in correct list:\n'


    for FILE in $CFILES; do
        OUTPUT="$STUDENT_DIRECTORY/OUTPUT"
        mkdir -p $OUTPUT
        MANUAL="$STUDENT_DIRECTORY/MANUAL"
        mkdir -p $MANUAL
        FILE_NAME=$(basename $FILE .c)

        
        DIFFERENCE=$(diff <(echo "$FILE_NAME") <(echo "$SAMPLE_LIST") | wc -l)
        SAMPLE_COUNT=$(wc -w < <(echo "$SAMPLE_LIST"))

        if [ "$DIFFERENCE" != "$SAMPLE_COUNT" ]
        then
            cp $FILE "$MANUAL/$FILE_NAME.c"
            INTRUDERS+="$FILE_NAME\n" 
        fi
        
        
        gcc $FILE
        if [ "$?" == "0" ]
        then
            OUTPUTFILE="$OUTPUT/$FILE_NAME.txt"
            ./a.out > $OUTPUTFILE
            COMPILED+="$FILE_NAME\n"
        else
            cp $FILE "$MANUAL/$FILE_NAME.c"
            INTRUDERS+="$FILE_NAME\n"
        fi
    done
    LOG=$(echo -e "$COMPILED\n$INTRUDERS")
    cat <(echo "$LOG") > $STUDENT_DIRECTORY/log.txt 
done