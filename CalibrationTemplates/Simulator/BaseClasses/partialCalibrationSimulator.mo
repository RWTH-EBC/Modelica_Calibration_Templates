within CalibrationTemplates.Simulator.BaseClasses;
partial model partialCalibrationSimulator
  extends Modelica.Icons.Example;

  parameter Boolean use_aixcalibuha=false "Will the models be used via AixCaliBuHa?" annotation (Dialog(group="General", descriptionLabel=true), choices(checkBox=true));

  parameter String inputNames[:]={"dummyInput"} "Necessary to check if variables exist in given file for CombiTimeTable" annotation(Dialog(group="File Input"));
  parameter String targetNames[:]={"dummyTarget"} if not use_aixcalibuha "Necessary to check if variables exist in given file for CombiTimeTable" annotation(Dialog(enable=not use_aixcalibuha, group="File Input"));

  parameter String fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") annotation(Dialog(group="File Input"));
  parameter String fNameTargetsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") if  not use_aixcalibuha  annotation(Dialog(enable=not use_aixcalibuha, group="File Input"));
  parameter Integer lineWithHeaders = 3 annotation(Dialog(group="File Input - Advanced Settings"));
  parameter Integer startIndex=Modelica.Utilities.Strings.length("#time_in_s") + 2 annotation(Dialog(group="File Input - Advanced Settings"));
  parameter String delimiter="\t" annotation(Dialog(group="File Input - Advanced Settings"));

  replaceable CalibrationTemplates.Container.ModelContainer modelContainer(
    final use_aixcalibuha=use_aixcalibuha,
    final calBusTargetSimed=calBusTargetSimed,
    final calBusInput=calBusInput,
    final calBusTargetMeas=calBusTargetMeas)                                                                      constrainedby
    CalibrationTemplates.Container.ModelContainer                                                                                      annotation (Dialog(group="General"), choicesAllMatching=true, Placement(transformation(extent={{-24,-28},
            {26,26}})));
  replaceable parameter CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    tunerParameters constrainedby
    CalibrationTemplates.Database.TunerParameterBaseDataDefinition
    annotation (Dialog(group="General"), Evaluate=false, choicesAllMatching=true, Placement(transformation(extent={{-18,82},
            {18,118}})));

  replaceable CalibrationTemplates.Interfaces.CalBusInput calBusInput constrainedby
    CalibrationTemplates.Interfaces.CalBusInput
    annotation (Dialog(group="Bus Connectors"), choicesAllMatching=true, Placement(transformation(extent={{-136,64},
            {-122,78}})));
  replaceable CalibrationTemplates.Interfaces.CalBusTargetSimed calBusTargetSimed constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetSimed
    annotation (Dialog(group="Bus Connectors"), choicesAllMatching=true, Placement(transformation(extent={{150,62},
            {166,78}})));
  replaceable CalibrationTemplates.Interfaces.CalBusTargetMeas calBusTargetMeas if not use_aixcalibuha
  constrainedby CalibrationTemplates.Interfaces.CalBusTargetMeas
                                                         annotation (Dialog(group="Bus Connectors", enable=not use_aixcalibuha), choicesAllMatching=true, Placement(transformation(extent={{-138,
            -58},{-122,-42}})));

  Modelica.Blocks.Sources.CombiTimeTable tableInputsMeas(
    tableOnFile=true,
    tableName="inputsMeasured",
    fileName=fNameInputsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(headerSplittet=headersInputsMeas,
    inputNames=inputNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-180,60},
            {-160,80}})));
  Modelica.Blocks.Sources.CombiTimeTable tableTargetsMeas(
    tableOnFile=true,
    tableName="targetsMeasured",
    fileName=fNameTargetsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(headerSplittet=headersTargetsMeas,
    inputNames=targetNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) if not use_aixcalibuha annotation (Placement(transformation(extent={{-180,
            -60},{-160,-40}})));

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

  parameter String headerLineTargetsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameTargetsMeas), lineWithHeaders) if not use_aixcalibuha;
  parameter Integer nSizeTargets=Modelica.Utilities.Strings.count(string=headerLineTargetsMeas,
                                                          searchString=delimiter, startIndex=startIndex) if not use_aixcalibuha;
  parameter String headersTargetsMeas[nSizeTargets]=Functions.splitString(
      theString=headerLineTargetsMeas,
      delimiter=delimiter,
      startIndex=startIndex,
      nSize=nSizeTargets) if not use_aixcalibuha annotation(Dialog(group="Advanced Settings"));

equation

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
            {160,120}})),                                        Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-160,-100},{160,120}})),
              Diagram(coordinateSystem(extent={{-160,-120},{160,120}})), Icon(
        coordinateSystem(extent={{-160,-120},{160,120}})));
end partialCalibrationSimulator;
