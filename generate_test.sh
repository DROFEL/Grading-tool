#!/bin/bash
NAME=("" "George" "Jayden" "Arianne")
SURENAME=("" "May" "Smith" "Rull")

for i in $(seq 3); do
    for o in $(seq 3); do
    NAME=${NAME[i]}_${SURENAME[o]}
    DIR="lab1/$NAME"
    mkdir $DIR
    cat template > $DIR/labC.c
    done
done
