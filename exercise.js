var order;

var congrat = new Array("Yes, that's it.", "Correct.", "That's right.", "Very good.");

function showAnswer()
{
  var i, correct, str;

  if (answered)
  {
    el("feedback").innerHTML = "Click <b>Next Problem</b> to proceed.";
    return;
  }
  document.getElementById("correct").innerHTML = displayWord[order[prob]];
  answered = true;
}

function entered()
{
  var studentAnswer;
  var ok;
  
  if (answered)
  {
    el("feedback").innerHTML =
      "You’ve answered the question. Click <b>Next Problem</b>.";
  }
  else {
    studentAnswer = inputField.value.replace(/^\s*(.*?)\s*$/, "$1");
    studentAnswer = studentAnswer.replace(/\s\s+/g, " ");
    correct = russWord[order[prob]];

    ok = (correct == studentAnswer);

    if (ok)
    {
      answered = true;
      el("feedback").innerHTML =
        congrat[Math.floor(Math.random() * 4)];
      document.feedbackpic.src = "pics/ok3.png";
    }
    else
    {
      document.feedbackpic.src = "pics/bad3.png";
      nTries++;
      if (nTries == 2)
      {
        el("feedback").innerHTML =
          "The correct answer is shown above.";
        showAnswer();
      }
      else
      {
        el("feedback").innerHTML =
          "Sorry, that's not it. Please try again.";
      }
    }
  }
}

function nextProblem()
{
  prob++;
  nTries = 0;
  answered = false;
  if (prob >= maxProb)
  {
    top.location.href = nextPageURL;
  }
  else
  {
    var english = document.getElementById("english");
    document.feedbackpic.src = "pics/mt3.png";
    el("feedback").innerHTML = "&nbsp;";
    el("correct").innerHTML = "&nbsp;"
    el("prob").innerHTML = prob+1;
    english.innerHTML = engWord[order[prob]];

    inputField.focus();
    clearInput();
  }
}

function startExercise()
{
  var i, j, k;
  
  inputField = document.getElementById("russian");
  inputField.addEventListener("keydown", kpress, true);
  inputField.value = "";
  prob = -1;
  maxProb = engWord.length;
  el("maxProb").innerHTML = maxProb;
  order = new Array(maxProb);
  for (i = 0; i < maxProb; i++)
  {
    order[i] = i;
  }
  for (i = 0; i < maxProb; i++)
  {
    j = i + Math.floor(Math.random() * (maxProb-i));
    k = order[i];
    order[i] = order[j];
    order[j] = k;
  }
  nextProblem();
}
