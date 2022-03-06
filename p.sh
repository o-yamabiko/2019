#!/bin/bash

#nn.mdファイルから音無しnnp.mdファイル作成

i=1
while [[ $i -le 12 ]] ; do
printf -v j "%02d" $((i)) # $iの数値を2桁文字列に変換したものを$j に入れる
sed \
    -e '/^oto:/d' \
    -e '/^gra:/d' \
    -e '/^background:/d' \
    -e '/^imagefrom:/d' \
    -e '/^imagefromurl:/d' \
    -e 's/^\(tugi:.*\)/\1\nnoindex: true\nprint: true/' \
    $j".md" > $j"p.md"
let i="$i + 1"
done

