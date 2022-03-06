#!/bin/bash

# $1 は年、yyyy

for i in *.md ; do

mv $i orig$i
j=`basename $i .md` #ファイル名から拡張子を取り除いた文字列、今号の月を表す2桁文字列

# 今号、前号、次号の年と月を取り出し
if [[ $j == '01' ]] ; then
maey="`echo $1 | bc -l` - 1" #文字列$1を数値に変換して計算
printf -v maey "%02d" $((maey)) #数値を4桁文字列に変換
maem=12
tugy=$1
tugm=02

elif [[ $j == '12' ]] ; then
maey=$1
maem=11
tugy="`echo $1 | bc -l` + 1"
printf -v tugy "%02d" $((tugy)) #数値を4桁文字列に変換
tugm=01

else
maey=$1
maem="`echo $j | bc -l`-1"  #文字列$jを数値に変換して計算
printf -v maem "%02d" $((maem)) #数値を2桁文字列に変換
tugy=$1
tugm="`echo $j | bc -l`+1"
printf -v tugm "%02d" $((tugm))
fi

sed \
    -e '/^docid:/d' \
    -e 's/tusin'$1'//g' \
    -e 's/\(navigation: true\)/\1\nmae: '$maey'\/'$maem'\nkore: '$1'\/'$j'\ntugi: '$tugy'\/'$tugm'/' \
    orig$i > $i

done
