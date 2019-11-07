within CalibrationTemplates.Functions;
function splitString
  input String theString;
  input String delimiter = "\t";
  input Integer startIndex = 1;
  input Integer nStringArray(min=1);
  output String strArray[nStringArray];

protected
  Integer lastDelIndex;
  Integer currIndex;
  Integer counter;
  Integer nextIndex;

algorithm

  lastDelIndex :=Modelica.Utilities.Strings.findLast(theString, delimiter);
  currIndex := startIndex;
  counter :=1;
  nextIndex :=0;

  while currIndex < lastDelIndex loop
    nextIndex :=Modelica.Utilities.Strings.find(
        theString,
        delimiter,
        currIndex);
    strArray[counter] :=Modelica.Utilities.Strings.substring(
        theString,
        currIndex,
        nextIndex - 1);
    currIndex := nextIndex+1;
    counter := counter + 1;
  end while;

  strArray[nStringArray] :=Modelica.Utilities.Strings.substring(
      theString,
      currIndex,
      Modelica.Utilities.Strings.length(theString));

end splitString;
