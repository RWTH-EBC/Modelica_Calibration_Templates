within CalibrationTemplates.Simulator;
partial model PartialCalibrationSimulator
  extends Modelica.Icons.Example;

  replaceable CalibrationTemplates.Container.ModelContainer modelContainer constrainedby
    CalibrationTemplates.Container.ModelContainer                                                                                      annotation (Dialog(group="General"), choicesAllMatching=true, Placement(transformation(extent={{-24,-28},
            {26,26}})));
  replaceable parameter CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    tunerParameters constrainedby
    CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    annotation (Dialog(group="General"), Evaluate=false, choicesAllMatching=true, Placement(transformation(extent={{-18,82},
            {18,118}})));

  parameter String inputNames[:]={"dummyInput"} "Necessary to check if variables exist in given file for CombiTimeTable" annotation(Dialog(group="File Input"));

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") annotation(Dialog(group="File Input"));
  parameter Integer lineWithHeaders = 3 annotation(Dialog(group="File Input - Advanced Settings"));
  parameter Integer startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2 annotation(Dialog(group="File Input - Advanced Settings"));
  parameter String delimiter="\t" annotation(Dialog(group="File Input - Advanced Settings"));

  replaceable CalibrationTemplates.Interfaces.CalBusInput calBusInput constrainedby
    CalibrationTemplates.Interfaces.CalBusInput
    annotation (Dialog(group="Bus Connectors"), choicesAllMatching=true, Placement(transformation(extent={{-136,64},
            {-122,78}})));
  replaceable CalibrationTemplates.Interfaces.CalBusTargetSimed calBusTargetSimed constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetSimed
    annotation (Dialog(group="Bus Connectors"), choicesAllMatching=true, Placement(transformation(extent={{150,62},
            {166,78}})));
  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(headerSplittet=headersInputsMeas,
    inputNames=inputNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-180,60},
            {-160,80}})));

protected
  parameter String headerLineInputsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameInputsMeas), lineWithHeaders);
  parameter Integer nSizeInputs=Modelica.Utilities.Strings.count(string=headerLineInputsMeas,
                                                          searchString=delimiter, startIndex=startIndex);
  parameter String headersInputsMeas[nSizeInputs]=Functions.splitString(
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
