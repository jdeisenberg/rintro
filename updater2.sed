/<table width="100%">/,/<\/table>/ {
  s/<table width="100%">/<nav>/
  /<tr>/d
  /<\/tr>/d
  s/<td class="\([a-z]\+\)">/<span class="\1">/
  /<img src="l_arrow.png"/ {
    N
    s/<img[^>]\+>/\&larr; /
  }
  /<img src="up_arrow.png"/ {
    N
    s/<img[^>]\+>/\&uarr; /
  }
  /<img src="r_arrow.png"/ {
    N
    s/<img[^>]\+>/\&rarr;/
 }
 s/ &nbsp;//
 s/<\/td>/<\/span>/
 s/<\/table>/<\/nav>/
}

  
  
