1i\
<!DOCTYPE html>

$i\
<audio id="sound">\
  <source id="ogg" src="silent.ogg" type="audio/ogg"/>\
  <source id="wav" src="silent.wav" type="audio/wav"/>\
</audio>

/<head>/a\
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\
  <link rel="stylesheet" type="text/css" href="rstyle.css"/>
  
1,$s/language="Javascript"/type="text\/javascript"/

/<body/{
  s/ bgcolor="#ffffff"//
  s/ onload="openSoundWindow();"//
}

1,$s/\.htm"/.html"/g

1,$s/\.gif"/.png"/g

/l_arrow.png/{
  s/width="33%" align="left"/class="back"/
  N
  s/alt=" "/alt="Back"/
}

/r_arrow.png/{
  s/width="33%" align="right"/class="next"/
  N
  s/alt=" "/alt="Next"/
}

/up_arrow.png/{
  s/width="33%" align="center"/class="up"/
  N
  s/alt=" "/alt="Up"/
}

