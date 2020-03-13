within CalibrationTemplates.SimulatorTemplate.BaseClasses;
partial model PartialCalibrationSimulator
  extends Modelica.Icons.Example;

  replaceable CalibrationTemplates.Interfaces.Containers.ModelContainer modelContainer constrainedby CalibrationTemplates.Interfaces.Containers.ModelContainer "Replace with your model" annotation (
    Dialog(group="General"),
    choicesAllMatching=true,
    Placement(transformation(extent={{-24,-28},{26,26}})));
  replaceable parameter CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    tunerParameters constrainedby CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    "Replace with your tuner-parameters record"
    annotation (Dialog(group="General"), Evaluate=false, choicesAllMatching=true, Placement(transformation(extent={{-18,82},
            {18,118}})));

  parameter String inputNames[:]={"dummyInput"} "Necessary to check if variables exist in given file for CombiTimeTable" annotation(Dialog(group="File Input"));

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") "Specify the file-name for the inputs to your system" annotation(Dialog(group="File Input"));
  parameter Integer lineWithHeaders = 3 "Specify in which line of the txt-file the header is located" annotation(Dialog(tab="Advanced File Input"));
  parameter Integer startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2 "Input the name of the first column (always time)" annotation(Dialog(tab="Advanced File Input"));
  parameter String delimiter="\t" "Which delimiter is used in the header?" annotation(Dialog(tab="Advanced File Input"));

  replaceable CalibrationTemplates.Interfaces.CalBusInputs calBusInput
    constrainedby CalibrationTemplates.Interfaces.CalBusInputs
    "Replacable connector for Inputs to the System"            annotation (
    Dialog(group="Bus Connectors"),
    choicesAllMatching=true,
    Placement(transformation(extent={{-136,64},{-122,78}})));
  replaceable CalibrationTemplates.Interfaces.CalBusTargetsSimed
    calBusTargetSimed constrainedby CalibrationTemplates.Interfaces.CalBusTargetsSimed
    "Replacable connector for simulated Target Values (outputs)"
                                                       annotation (
    Dialog(group="Bus Connectors"),
    choicesAllMatching=true,
    Placement(transformation(extent={{150,62},{166,78}})));
  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(
        headerSplitted =                                                           headersInputsMeas,
    inputNames=inputNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-180,60},
            {-160,80}})));

protected
  parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  parameter Integer nSizeInputs=Modelica.Utilities.Strings.count(string=headerLineInputsMeas,
                                                          searchString=delimiter, startIndex=startIndex-1);
  parameter String headersInputsMeas[nSizeInputs]=CalibrationTemplates.Functions.splitString(
      theString=headerLineInputsMeas,
      delimiter=delimiter,
      startIndex=startIndex,
      nSize=nSizeInputs) annotation(Dialog(group="Advanced Settings"));

equation

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
            {160,120}})),                                        Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-160,-100},{160,120}})),
              Diagram(coordinateSystem(extent={{-160,-120},{160,120}})), Icon(
        coordinateSystem(extent={{-160,-120},{160,120}})));
end PartialCalibrationSimulator;
