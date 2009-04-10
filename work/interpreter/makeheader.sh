echo "#include \"_$1\"" > $1
gawk 'BEGIN {FS="\177"};/\(/{print $1 ";"}' TAGS >> $1