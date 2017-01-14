function playSound(filename)
{
  var sound = document.getElementById("sound");
  if (sound.canPlayType("audio/ogg")) {
    sound.src = filename + ".ogg";
  } else {
    sound.src = filename + ".wav";
  }
  sound.play();
}
