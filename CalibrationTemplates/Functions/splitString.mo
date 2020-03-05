within CalibrationTemplates.Functions;
function splitString
  input String theString;
  input String delimiter = "\t";
  input Integer startIndex = 1;
  input Integer nSize;
  output String strArray[nSize];

protected
  Integer currIndex;
  Integer counter;
  Integer nextIndex;

algorithm

  currIndex := startIndex;
  counter :=1;
  nextIndex :=0;

  while counter < nSize loop
    nextIndex :=Modelica.Utilities.Strings.find(
        theString,
        delimiter,
        currIndex);
    strArray[counter] := Modelica.Utilities.Strings.substring(
        theString,
        currIndex,
        nextIndex - 1);
    currIndex := nextIndex+1;
    counter := counter + 1;
  end while;

  strArray[nSize] := Modelica.Utilities.Strings.substring(
      theString,
      currIndex,
      Modelica.Utilities.Strings.length(theString));

end splitString;
