within CalibrationTemplates.Simulator;
partial model CalibrationSimulator
  extends
    CalibrationTemplates.Simulator.BaseClasses.PartialCalibrationSimulator;

  parameter String targetNames[:]={"dummyTarget"} "Necessary to check if variables exist in given file for CombiTimeTable" annotation(Dialog(group="File Input"));
  parameter String fNameTargetsMeas = Modelica.Utilities.Files.loadResource("modelica://LibName/../../ts_data/file_inputsMeas_manipulated.txt") "Specify the file-name for the target values measured"  annotation(Dialog(group="File Input"));

  replaceable CalibrationTemplates.Interfaces.CalBusTargetsMeas
    calBusTargetMeas constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetsMeas "Replacable connector for measured Target Values (outputs)" annotation (
    Dialog(group="Bus Connectors"),
    choicesAllMatching=true,
    Placement(transformation(extent={{-138,-58},{-122,-42}})));

  Modelica.Blocks.Sources.CombiTimeTable tableTargetsMeas(
    tableOnFile=true,
    tableName="targetsMeasured",
    fileName=fNameTargetsMeas,
    columns=CalibrationTemplates.Functions.getColumnsMatchingString(
        headerSplitted =                                                           headersTargetsMeas,
    inputNames=targetNames) .+ 1,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-180,
            -60},{-160,-40}})));

  replaceable
  InterfaceRouter.PreProcessor preProcessor                                                             constrainedby
    InterfaceRouter.PreProcessor "Replace with your own preprocessing"           annotation (Dialog(group="Processing"), Placement(transformation(extent={{-84,-76},
            {-56,84}})),                                                                                        choicesAllMatching=true);
  replaceable
  InterfaceRouter.PostProcessor postProcessor                                                                 constrainedby
    InterfaceRouter.PostProcessor "Replace with your own postprocessing"             annotation (Dialog(group="Processing"), Placement(transformation(extent={{52,-76},
            {84,84}})),                                                                                         choicesAllMatching=true);
  Interfaces.CalBusTargetsMeas calBusTargetMeasOut
    annotation (Placement(transformation(extent={{148,-64},{168,-36}})));
protected
  parameter String headerLineTargetsMeas = Modelica.Utilities.Streams.readLine(
    Modelica.Utilities.Files.fullPathName(fNameTargetsMeas), lineWithHeaders);
  parameter Integer nSizeTargets=Modelica.Utilities.Strings.count(string=headerLineTargetsMeas,
                                                          searchString=delimiter, startIndex=startIndex-1);
  parameter String headersTargetsMeas[nSizeTargets]=CalibrationTemplates.Functions.splitString(
      theString=headerLineTargetsMeas,
      delimiter=delimiter,
      startIndex=startIndex,
      nSize=nSizeTargets) annotation(Dialog(group="Advanced Settings"));
equation

  connect(postProcessor.calBusTargetsSimedOut, calBusTargetSimed) annotation (
      Line(
      points={{84.8,52},{124,52},{124,70},{158,70}},
      color={255,204,51},
      thickness=0.5));
  connect(modelContainer.calBusTargetSimed, postProcessor.calBusTargetsSimedIn)
    annotation (Line(
      points={{25.75,-1},{25.75,-2},{38,-2},{38,52},{52.8,52}},
      color={255,204,51},
      thickness=0.5));
  connect(preProcessor.calBusTargetsMeasOut, postProcessor.calBusTargetsMeasIn)
    annotation (Line(
      points={{-55.3,-44},{-6,-44},{-6,-44},{52.8,-44}},
      color={255,204,51},
      thickness=0.5));
  connect(calBusTargetMeas, preProcessor.calBusTargetsMeasIn) annotation (Line(
      points={{-130,-50},{-106,-50},{-106,-44},{-83.3,-44}},
      color={255,204,51},
      thickness=0.5));
  connect(calBusInput, preProcessor.calBusInputsIn) annotation (Line(
      points={{-129,71},{-106,71},{-106,52},{-83.3,52}},
      color={255,204,51},
      thickness=0.5));
  connect(preProcessor.calBusInputsOut, modelContainer.calBusInput) annotation (
     Line(
      points={{-55.3,52},{-38,52},{-38,-1},{-24.25,-1}},
      color={255,204,51},
      thickness=0.5));
  connect(postProcessor.calBusTargetsMeasOut, calBusTargetMeasOut) annotation (
      Line(
      points={{84.8,-44},{132,-44},{132,-50},{158,-50}},
      color={255,204,51},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
            {160,120}})),                                        Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-160,-100},{160,120}})),
              Diagram(coordinateSystem(extent={{-160,-120},{160,120}})), Icon(
        coordinateSystem(extent={{-160,-120},{160,120}})));
end CalibrationSimulator;
