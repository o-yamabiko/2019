#!/bin/bash

# $1 is a current name element : 名前の一部で消したい部分
# rename -n 's/\.DAT/\.dat/' *

rename -n 's/'$1'//' *$1* #試し用
#rename 's/'$1'//' *$1* #実際用

