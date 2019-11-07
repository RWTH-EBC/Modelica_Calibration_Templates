within CalibrationTemplates.Simulator;
model CaliSimWithTables
  extends CalibrationSimulator;

  parameter String inputNames[:] = {"inputDummy1", "inputDummy2"};
  parameter String targetNames[:] = {"targetDummy1", "targetDummy2"};
  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt");
  parameter String fNameTargetsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_targetsMeas_manipulated.txt");
  parameter Integer lineWithHeaders = 3;
  final parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  final parameter String headerLineTargetsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameTargetsMeas), lineWithHeaders);
  parameter String headersInputsMeas[size(inputNames, 1)]=Functions.splitString(
      theString=headerLineInputsMeas,
      delimiter="\t",
      startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2,
      nStringArray=size(inputNames, 1));
  parameter String headersTargetsMeas[size(targetNames, 1)]=Functions.splitString(
      theString=headerLineTargetsMeas,
      delimiter="\t",
      startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2,
      nStringArray=size(targetNames, 1));


  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=2:nInputsMeasTS + 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Sources.CombiTimeTable tableTargetsMeas(
    tableOnFile=true,
    tableName="targetsMeasured",
    fileName=fNameTargetsMeas,
    columns=2:nTargetsMeasTS + 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));

initial equation
  for i in 1:size(inputNames, 1) loop
    assert(Modelica.Utilities.Strings.isEqual(inputNames[i], headersInputsMeas[i]), "Names of measured inputs defined in Modelica must equal headers in read in file.\n
      But names are "+inputNames[i]+" in Modelica and "+headersInputsMeas[i]+" in the table file.", AssertionLevel.error);
  end for;
  for i in 1:size(targetNames, 1) loop
    assert(Modelica.Utilities.Strings.isEqual(targetNames[i], headersTargetsMeas[i]), "Names of measured targets defined in Modelica must equal headers in read in file.\n
      But names are "+targetNames[i]+" in Modelica and "+headersTargetsMeas[i]+" in the table file.", AssertionLevel.error);
  end for;

equation


  connect(tableInputsMeas.y, preProcessor.inInputsMeas) annotation (Line(points={{-79,50},{-74,50},{-74,48},{-67.6,48}}, color={0,0,127}));
  connect(tableTargetsMeas.y, preProcessor.inTargetsMeas) annotation (Line(points={{-79,-50},{-74,-50},{-74,-48},{-67.6,-48}}, color={0,0,127}));
end CaliSimWithTables;
