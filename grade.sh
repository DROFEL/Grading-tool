BASE=$1
PROCESSED="$1_PROCESSED"
SAMPLEPATH="$2"
if [ ! -d $PROCESSED ]
then
    mkdir $PROCESSED
fi

OUTPUT="$PROCESSED/OUTPUT"

if [ ! -d $OUTPUT ]
then
    mkdir $OUTPUT
fi

SAMPLELIST=$(ls $2)

for LINE in $SAMPLELIST
do
echo $LINE
done

for DIR in $BASE/*; do
    CFILES=$(find $DIR -name "*.c")
    echo $CFILES
    for FILE in $CFILES; do
        FILENAME=$(basename $FILE .c)
        STUDENTNAME=${FILE%/*}
        STUDENTNAME="${STUDENTNAME##*/}"
        OUTPUTFILE="$OUTPUT/$STUDENTNAME/$FILENAME"
        echo $OUTPUTFILE
        mkdir "$OUTPUT/$STUDENTNAME/"
        gcc $FILE
        ./a.out > $OUTPUTFILE
    done
done