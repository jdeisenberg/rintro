var nLetters = 0;
var inputBuf = new Array(10);
var maxInput = 0;

var russianLetters = "абвгдеёжзийклмнопрстуфхцчшщъыьэюяабвгдеёжзийклмнопрстуфхцчшщъыьэюя";
//                    012345678901234567890123456789012
//                              1         2         3
var englishKeys =    "abvgde']zijklmnoprstufxchw`=y-\\[qABVGDE']ZIJKLMNOPRSTUFXCHW`=Y-\\[Q";
var inputField;

function el(theId) {
    return document.getElementById(theId);
}

function clearInput()
{
  document.getElementById("russian").value = "";
}

function setInput( nMax )
{
  clearInput( nMax );
}

function kclick(event)
{
  var n = event.target.getAttribute("id").substring(1);
  if (n == 'Enter') {
    entered();
  }
  else if (n == 'Backspace') {
    if (inputField.selectionStart > 0){
      if (inputField.selectionStart == inputField.selectionEnd) {
        inputField.selectionStart--;
      }
      updateField('');
      inputField.selectionStart--;
      inputField.selectionEnd--;
    }
    inputField.focus();
  }
  else {
    n = parseInt(n);
    if (n < 0) {
      insertChar(String.fromCharCode(-n));
    }
    else {
      insertChar(englishKeys[n - 1]);
    }
    inputField.focus();
  }
  return false;
}

function updateField(char) {

  var cursorPos = inputField.selectionStart;
  var value = inputField.value;
  value = value.substring(0, inputField.selectionStart) + char +
      value.substring(inputField.selectionEnd);
  inputField.value = value;
  inputField.selectionStart = cursorPos + 1;
  inputField.selectionEnd = cursorPos + 1;
}

function insertChar(charCode) {
    var pos = validKeys.indexOf(charCode);

    if (pos >= 0 && inputField.value.length - (inputField.selectionEnd - inputField.selectionStart) < inputField.maxLength) {
      updateField(russKeys[pos]);
    }
}

/*
 * Filter out alpha keys to the valid set
 */
function kpress( theEvent )
{
  var charCode = theEvent.key
  
  if (theEvent.defaultPrevented) {
    return; // Do nothing if the event was already processed
  }

  if (charCode.length == 1) {
      charCode = charCode.toLowerCase();
      /* check that there's no CTRL or ALT in play */
      if (! (theEvent.ctrlKey || theEvent.metaKey)) {
        insertChar(charCode);
        theEvent.preventDefault();
     }
  }
  else if (charCode == 'Enter') {
      entered();
      theEvent.preventDefault();
  }
}


