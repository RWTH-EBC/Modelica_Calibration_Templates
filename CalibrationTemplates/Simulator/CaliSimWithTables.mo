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
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-160,40},
            {-140,60}})));
  Modelica.Blocks.Sources.CombiTimeTable tableTargetsMeas(
    tableOnFile=true,
    tableName="targetsMeasured",
    fileName=fNameTargetsMeas,
    columns=2:nTargetsMeasTS + 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-160,
            -60},{-140,-40}})));

  Interfaces.CalBusInput calBusInput
    annotation (Placement(transformation(extent={{-108,36},{-88,58}})));
  Interfaces.CalBusTargetMeas calBusTargetMeas
    annotation (Placement(transformation(extent={{-110,-58},{-90,-38}})));
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


  connect(preProcessor.inTargetsMeas, calBusTargetMeas) annotation (Line(
      points={{-67.6,-48},{-100,-48}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(preProcessor.inInputsMeas, calBusInput) annotation (Line(
      points={{-67.6,48},{-77.8,48},{-77.8,47},{-98,47}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  annotation (Diagram(coordinateSystem(extent={{-160,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-160,-100},{100,100}})));
end CaliSimWithTables;
