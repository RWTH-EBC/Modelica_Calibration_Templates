within CalibrationTemplates.Functions;
function getColumnsMatchingString
  input String headerSplitted[:];
  input String inputNames[:];
  output Integer columns[size(inputNames, 1)];
algorithm
  //Modelica.Utilities.Streams.print(String(columns));
  for i in 1:size(inputNames, 1) loop
    for h in 1:size(headerSplitted, 1) loop
      // Check for matches in the list an append the index to the columns
      // This does not check if multiple columns with same name exist, but
      // this specific case is unlikely as the file was exported using aixcalibuha
      if headerSplitted[h]==inputNames[i] then
        columns[i] := h;
      end if;
    end for;
    // If the column is still empty, an error has to be raised.
    assert(columns[i] > 0, "No match found for "+inputNames[i],  AssertionLevel.error);
  end for;

end getColumnsMatchingString;
