within CalibrationTemplates.Simulator;
model CaliSimWithTables
  extends CalibrationSimulator;

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt");
  parameter String fNameTargetsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_targetsMeas_manipulated.txt");
  parameter Integer lineWithHeaders = 3;
  parameter String headersInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  parameter String headersTargetsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameTargetsMeas), lineWithHeaders);

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
equation
  connect(tableInputsMeas.y, preProcessor.inInputsMeas) annotation (Line(points={{-79,50},{-74,50},{-74,48},{-67.6,48}}, color={0,0,127}));
  connect(tableTargetsMeas.y, preProcessor.inTargetsMeas) annotation (Line(points={{-79,-50},{-74,-50},{-74,-48},{-67.6,-48}}, color={0,0,127}));
end CaliSimWithTables;
