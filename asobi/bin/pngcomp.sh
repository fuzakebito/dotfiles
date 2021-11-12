#!/usr/bin/bash
#$1の末尾の.pngを削除して$fに代入
f=`echo $1 | sed -e 's/.png$//g'`
#f-fs8.pngが存在すれば削除する
if [ -e "$f-fs8.png" ]; then
	rm "$f-fs8.png"
fi
#f-comp.pngが存在すれば削除する
if [ -e "$f-comp.png" ]; then
	rm "$f-comp.png"
fi
#$f.pngをpngquantで圧縮
pngquant --floyd=1 --speed=1 --quality=0-97 "$f.png"
#pngquantの出力である$f-fs8.pngをzopflipngで圧縮
zopflipng -m --lossy_transparent --lossy_8bit --filters=0me "$f-fs8.png" "$f-comp.png"
#$f-fs8を削除
rm "$f-fs8.png"
