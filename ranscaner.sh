clear
file="$1"
file2="list"
if [ ! -f $file2 ]; then
    echo "New Scan!"
    cp $file $file2
    count=$(cat $file |wc -l)
    echo "Target :" $count
else
    count2=$(cat $file2 |wc -l)
    echo "File exist! : "$count2
    mv $file2 $RANDOM
    cp $file $file2
    
fi

c1=1
while IFS= read line
do
        # display $line or do somthing with $line

       y=$( curl -s -k "$line" | egrep -c containers )
       if [ "$y" = "1" ]; then
       echo "$line" >> found
       printf "$c1 "/" $count2 ":" "$line""
       printf " ok\n"

       fi
       ((c1++))
       sed -i '1d' $file2
done <"$file2"
