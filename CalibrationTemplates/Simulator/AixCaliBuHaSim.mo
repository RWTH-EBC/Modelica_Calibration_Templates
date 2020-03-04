within CalibrationTemplates.Simulator;
partial model AixCaliBuHaSim
  extends Modelica.Icons.Example;

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") annotation(Dialog(group="Set inside AixCaliBuHa"));
  parameter Integer lineWithHeaders = 3 annotation(Dialog(group="Advanced Settings"));
  parameter String headersInputsMeas[size(inputNames, 1)]=Functions.splitString(
      theString=headerLineInputsMeas,
      delimiter="\t",
      startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2,
      nStringArray=size(inputNames, 1)) annotation(Dialog(group="Advanced Settings"));

  replaceable CalibrationTemplates.Container.ModelContainer modelContainer(final use_aixcalibuha=true) constrainedby
    CalibrationTemplates.Container.ModelContainer                                                                                      annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24}, {28,32}})));
  replaceable Database.TunerParameterBaseDataDefinition
    tunerParameters constrainedby Database.TunerParameterBaseDataDefinition
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-96,64},
            {-64,96}})));
  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=2:nInputsMeasTS + 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-100,6},
            {-72,34}})));
protected
  parameter Integer nTargetsSimedTS=modelContainer.nTargetsSimedTS "Number of simulated target time series";
  parameter Integer nInputsMeasTS=modelContainer.nInputsMeasTS "Number of measured input time series";
  parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  parameter String inputNames[:]=modelContainer.inputNames "";

initial equation
  for i in 1:size(inputNames, 1) loop
    assert(Modelica.Utilities.Strings.isEqual(inputNames[i], headersInputsMeas[i]), "Names of measured inputs defined in Modelica must equal headers in read in file.\n
      But names are "+inputNames[i]+" in Modelica and "+headersInputsMeas[i]+" in the table file.", AssertionLevel.error);
  end for;
equation

  connect(tableInputsMeas.y, modelContainer.inInputsMeas) annotation (Line(
        points={{-70.6,20},{-68,20},{-68,20.8},{-27.72,20.8}},
                                                            color={0,0,127}));

end AixCaliBuHaSim;
