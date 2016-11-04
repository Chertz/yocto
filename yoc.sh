#!/bin/bash

echo "Hi. Yoc for $YOC_MOD"

while read -p "Task Tag ** [f]etch, confi[g]ure, [c]ompile, [i]nstall, copy-[t]arget], [b]uild, change-[m]odule, e[x]it ** : " task
do

if [ "$task" == 'f' ]; then
echo "bitbake $YOC_MOD -f -c fetch"
bitbake $YOC_MOD -f -c fetch

elif [ "$task" == 'g' ]; then
echo "bitbake $YOC_MOD -f -c configure"
bitbake $YOC_MOD -f -c configure

elif [ "$task" == 'c' ]; then
echo "bitbake $YOC_MOD -f -c compile"
bitbake $YOC_MOD -f -c compile

elif [ "$task" == 'i' ]; then
echo "bitbake $YOC_MOD -f -c install"
bitbake $YOC_MOD -f -c install

elif [ "$task" == 'b' ]; then
echo "bitbake $YOC_MOD -f -c build"
bitbake $YOC_MOD -f -c install

elif [ "$task" == 't' ]; then
echo "Copying Image To Target ..."
sudo cp -R tmp/work/aarch64-gnu-linux/$YOC_MOD/*/image/usr/ ~/targetfs/.

elif [ "$task" == 'm' ]; then
read -p "New Module Name : " module
export YOC_MOD="$module"

elif [ "$task" == 'x' ]; then
echo "Thanks.."
exit 1;

fi

done
