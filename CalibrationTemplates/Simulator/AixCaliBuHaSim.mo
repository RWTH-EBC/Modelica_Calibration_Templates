within CalibrationTemplates.Simulator;
partial model AixCaliBuHaSim
  extends Modelica.Icons.Example;

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") annotation(Dialog(group="Set inside AixCaliBuHa"));
  parameter Integer lineWithHeaders = 3 annotation(Dialog(group="Advanced Settings"));
  parameter Integer startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2;
  parameter String delimiter="\t";
  parameter String headersInputsMeas[nSize]=Functions.splitString(
      theString=headerLineInputsMeas,
      delimiter=delimiter,
      startIndex=startIndex,
      nSize=nSize) annotation(Dialog(group="Advanced Settings"));

  replaceable CalibrationTemplates.Container.ModelContainer modelContainer(final use_aixcalibuha=true) constrainedby
    CalibrationTemplates.Container.ModelContainer                                                                                      annotation (choicesAllMatching=true, Placement(transformation(extent={{-18,-24},
            {38,32}})));
  replaceable parameter CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    tunerParameters constrainedby
    CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    annotation (Evaluate=false, choicesAllMatching=true, Placement(transformation(extent={{-96,64},
            {-64,96}})));
  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(headerSplittet=headersInputsMeas,
    inputNames=inputNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-108,
            -26},{-80,2}})));
 Interfaces.sigBusCalibration outTargetsSimed
    "Have outputs of model on top-level"
    annotation (Placement(transformation(extent={{82,-16},{122,24}})));
  Interfaces.sigBusCalibration sigBusCalibration
    annotation (Placement(transformation(extent={{-58,-22},{-38,-2}})));
protected
  parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  parameter Integer nSize=Modelica.Utilities.Strings.count(string=headerLineInputsMeas,
                                                          searchString=delimiter, startIndex=startIndex);
  parameter String inputNames[:]=modelContainer.inputNames "";
  parameter Integer nInputsMeasTS=size(inputNames, 1);



//initial equation
  //for i in 1:size(inputNames, 1) loop
  //  assert(Modelica.Utilities.Strings.isEqual(inputNames[i], headersInputsMeas[i]), "Names of measured inputs defined in Modelica must equal headers in read in file.\n
  //    But names are "+inputNames[i]+" in Modelica and "+headersInputsMeas[i]+" in the table file.", AssertionLevel.error);
  //end for;
equation
  connect(modelContainer.outTargetsSimed, outTargetsSimed) annotation (Line(
      points={{37.72,4},{102,4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(modelContainer.inInputsMeas, sigBusCalibration) annotation (Line(
      points={{-17.72,18.56},{-32.86,18.56},{-32.86,-12},{-48,-12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end AixCaliBuHaSim;
