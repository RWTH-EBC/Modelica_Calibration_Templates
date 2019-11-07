within CalibrationTemplates.Container;
partial model ModelContainer

  parameter Integer nInputsMeasTS(min=1) "Number of measured input time series" annotation(Dialog(group="Number in- and outputs"));
  parameter Integer nTargetsMeasTS(min=1) "Number of measured target time series" annotation(Dialog(group="Number in- and outputs"));
  parameter Integer nTargetsSimedTS(min=1) "Number of simulated target time series" annotation(Dialog(group="Number in- and outputs"));

  Interfaces.RealVectorInputs inTargetsMeas[nTargetsMeasTS] annotation (Placement(transformation(extent={{-112,-86},{-86,-34}})));
  Interfaces.RealVectorInputs inInputsMeas[nInputsMeasTS] annotation (Placement(transformation(extent={{-112,34},{-86,86}})));
  Interfaces.RealVectorOutputs outTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{88,-26},{114,26}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelContainer;
