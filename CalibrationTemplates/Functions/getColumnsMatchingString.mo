within CalibrationTemplates.Functions;
function getColumnsMatchingString
  input String headerSplittet[:];
  input String inputNames[:];
  output Integer columns[size(inputNames, 1)];
algorithm
  for i in 1:size(inputNames, 1) loop
    for h in 1:size(headerSplittet, 1) loop
      if headerSplittet[h]==inputNames[i] then
        columns[i] :=h;
      end if;
    end for;
  end for;

end getColumnsMatchingString;
