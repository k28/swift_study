#!/bin/bash
#
# サンプル用のテンプレートフォルダを作成するスクリプト
#

if [ $# -ne 1 ]; then
    echo "$0 <templete>"
    exit 1
fi

nSampleName=$1
nBaseTemplate="helloworld"

mkdir $nSampleName

# copy makefile and edit
cp ./$nBaseTemplate/Makefile ./$nSampleName/
sed -i '' -e "s/${nBaseTemplate}/${nSampleName}/" ./$nSampleName/Makefile

# make base source
touch ./$nSampleName/$nSampleName.swift

# make .gitignore
echo "$nSampleName" >> ./$nSampleName/.gitignore

