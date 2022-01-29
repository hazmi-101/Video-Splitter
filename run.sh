#!/bin/bash

# VIDEO SPLITER created by https://hazmi101 on 29/1/2022
# this program is without license

echo -e "VIDEO SPLITTER (shell script)\n\nFFMPEG HARUS TERINSTAL DI TERMINAL!\n\nprogram sederhana dan penuh kekurangan ini dibuat oleh:\nhttps://t.me/hazmi101\n\nmasukan nama/pacth ke file video\ncontoh: Download/tes.mp4\n>>>"
read video
f=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 ${video})
ffprobe=$(echo $f | awk '{printf("%d\n",$1 + 0.5)}')
echo -e "\n\nmasukan durasi split dalam format detik\ncontoh: 30\n>>>"
read split
part=1
awal=0
akhir=$split
echo -e "\n\nmasukan nama file hasil/output\ncontoh: hasil\n>>>"
read beres
while [ $awal -le $ffprobe ]
do
ffmpeg -i ${video} -ss ${awal} -t ${akhir} ${beres}_${part}.mp4
let "awal+=$split"
let "akhir+=$split"
let "part++"
done
echo "SPLIT VIDEO BERHASIL"
