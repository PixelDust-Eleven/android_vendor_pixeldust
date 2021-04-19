#!/bin/sh

export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

touch $Changelog

echo "Generating changelog..."

for i in $(seq 30);
do
export After_Date=`date --date="$i days ago" +%F`
k=$(expr $i - 1)
export Until_Date=`date --date="$k days ago" +%F`
echo "====================" >> $Changelog;
echo "     $Until_Date    " >> $Changelog;
echo "====================" >> $Changelog;
repo forall -pc 'git log --after=$After_Date --until=$Until_Date --pretty=tformat:"%h  %s  [%an]" --abbrev-commit --abbrev=7' >> $Changelog
echo "" >> $Changelog;
done

sed -i 's/project/ */g' $Changelog
sed -i 's/[/]$//' $Changelog

cp $Changelog $OUT/system/etc/
cp $Changelog $OUT/
rm -rf $Changelog
