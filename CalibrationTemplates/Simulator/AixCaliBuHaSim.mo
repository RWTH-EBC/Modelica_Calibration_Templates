within CalibrationTemplates.Simulator;
partial model AixCaliBuHaSim
  extends Modelica.Icons.Example;

  parameter String inputNames[:] = {"inputDummy1", "inputDummy2"};
  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") annotation(Dialog(group="Set inside AixCaliBuHa"));
  parameter Integer lineWithHeaders = 3 annotation(Dialog(group="Advanced Settings"));
  parameter String headersInputsMeas[size(inputNames, 1)]=Functions.splitString(
      theString=headerLineInputsMeas,
      delimiter="\t",
      startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2,
      nStringArray=size(inputNames, 1)) annotation(Dialog(group="Advanced Settings"));

  replaceable Container.ModelContainer modelContainer(final use_aixcalibuha=true) constrainedby
    Container.ModelContainer                                                                                                      annotation (choicesAllMatching=true, Placement(transformation(extent={{-32,-28},
            {28,34}})));

  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=2:nInputsMeasTS + 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-96,12},
            {-74,34}})));

protected
  parameter Integer nTargetsSimedTS=modelContainer.nTargetsSimedTS "Number of simulated target time series" annotation(Dialog(group="Number in- and outputs"));
  parameter Integer nInputsMeasTS=modelContainer.nInputsMeasTS "Number of measured input time series" annotation(Dialog(group="Number in- and outputs"));
  parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);

initial equation
  for i in 1:size(inputNames, 1) loop
    assert(Modelica.Utilities.Strings.isEqual(inputNames[i], headersInputsMeas[i]), "Names of measured inputs defined in Modelica must equal headers in read in file.\n
      But names are "+inputNames[i]+" in Modelica and "+headersInputsMeas[i]+" in the table file.", AssertionLevel.error);
  end for;

equation

  connect(tableInputsMeas.y, modelContainer.inInputsMeas) annotation (Line(
        points={{-72.9,23},{-68,23},{-68,21.6},{-31.7,21.6}},
                                                            color={0,0,127}));
end AixCaliBuHaSim;
