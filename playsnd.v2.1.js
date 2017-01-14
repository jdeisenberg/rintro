function playSound(filename)
{
  var sound = document.getElementById("sound");
  if (sound.canPlayType("audio/ogg")) {
    sound.src = filename + ".ogg";
  } else if (sound.canPlayType("audio/wav")) {
    sound.src = filename + ".wav";
  }
  else {
    sound.src = filename + ".mp3";
  }
  sound.play();
}
