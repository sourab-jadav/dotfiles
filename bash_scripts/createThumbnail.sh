#!/bin/bash
# Creates an index.html web page that displays image contents with a thumbnail image
codesrcdir='/var/www/html'
thisdomain="mydomain.org"

dname=$1
echo $dname

processFile() {
    extention=${img##*.}
    thumb=thumb-$img
    echo thumbname: $thumb
    echo Processing image:$img
    if [ $extention = "pdf" ]; then
       echo pdf image
       thumb=thumb_`basename $img .pdf`.jpg
       echo Thumb:$thumb
       gs -q -sDEVICE=png16m -dNOPAUSE -dBATCH -r35X36 -dPDFFitPage=true -dDEVICEWIDTH=185 -dDEVICEHEIGHT=185 -sOutputFile=$thumb $img

    elif [ $extention = "mp4" ]; then
       # ffmpeg not available avconv is almost the same
       # Generate icon image from first frames in video
       avconv -i $img -frames:v 1 tmpthumb.jpg

       # thumb image must end with image extention
       mp4image=`basename $thumb .mp4`.jpg
       echo mp4Img: $mp4image
       # Thumbnail image should have .jpg extention
       convert -thumbnail 80 tmpthumb.jpg $mp4image
       rm tmpthumb.jpg
       thumb=$mp4image
       echo mp4tumb: $thumb
    else
       if [ -f "$thumb" ]; then
          echo Thumb $thumb exists - skipping
       else
          echo "converting $img to thumb-$img"
          convert -thumbnail 80 $img $thumb
       fi
    fi

    if [ ! `echo $img|cut -c1-6` == "thumb-" ]; then
       modDate=`/bin/date +%Y/%m/%d-%H:%M:%S -d "$(/usr/bin/stat -c %x $img)"`
       filesize=`du -h $img|cut -f1`

       echo "         <tr><td><img src=$thumb alt=\"[img]\"></td><td> <a href=\"$img\">$img</a></td><td>${modDate}</td><td>${filesize}</td></tr>" >> $indexfile
    fi
}

# Length of argument string is greater than zero
if [ -n "$dname" ] # Directory for creating index
then
   echo "dname" is $dname
   cd $dname
   fullpath=`pwd`

   indexfile=$fullpath/index.html
   if [ -f $fullpath/index.html ]
   then
      # Check if re-creating index.hml is wanted, overwriting old file
      echo "Overwrite index.html in ${fullpath}? (y/n)"
      read ANS
      case $ANS in
         "Y"|"y")
            echo rewriting ${fullpath}/index.html
            > ${fullpath}/index.html;;
          *) echo "Index file preserved - exiting"
            exit;;
      esac
   fi

   # Prepare index file with headers
   cat ${codesrcdir}/cssheader.txt > $indexfile

   cat <<EOF >> $indexfile
   <body>
   <h1>Image Downloads Title</h1><html>

      <table width="800">
         <tr>
            <td><pre>                 </pre></td>
            <td width="200px"><a href="?C=N;O=A">Name</a></td>
            <td width="200px"><a href="?C=M;O=A">Last modified</a></td>
            <td width="200px"><a href="?C=S;O=A">Size</a></td>
            <td width="200px"><a href="?C=D;O=A">Description</a></td>
         </tr>
EOF
   if stat --printf='' *.jpg 2> /dev/null; then
      for img in *.jpg; do processFile; done
   fi
   if stat --printf='' *.JPG 2> /dev/null; then
      for img in *.JPG; do processFile; done
   fi
   if stat --printf='' *.png 2>/dev/null; then
      for img in *.png; do processFile; done
   fi
   if stat --printf='' *.mp4 2>/dev/null; then
      for img in *.mp4; do processFile; done
   fi
   if stat --printf='' *.pdf 2> /dev/null; then
      for img in *.pdf; do processFile; done
   fi

   cat <<EOF >>$indexfile
</table>
<pre><em>End of photo list - Sorry!<br />Add information and links!</em></pre>
<pre><a href="$thisdomain/fileservNew" title="Home">Return to Home Page</a>
<a href="$thisdomain/fileserv" title="Search">Search this Website</a>
</body>
</html>
EOF

echo "That's it"

else
   echo "Directory parameter required in calling this program."
   exit
fi
