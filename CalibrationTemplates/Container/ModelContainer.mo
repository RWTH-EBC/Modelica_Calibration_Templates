within CalibrationTemplates.Container;
partial model ModelContainer

  parameter Boolean use_aixcalibuha=False "Whether the models will be used via the AixCaliBuHa-Framework" annotation (choices(checkBox=true));

  parameter Integer nInputsMeasTS "Number of measured input time series" annotation(Dialog(group="Number in- and outputs", connectorSizing=true));
  parameter Integer nTargetsMeasTS "Number of measured target time series" annotation(Dialog(group="Number in- and outputs", connectorSizing=true, enable=not use_aixcalibuha));
  parameter Integer nTargetsSimedTS "Number of simulated target time series" annotation(Dialog(group="Number in- and outputs", connectorSizing=true));

  Interfaces.RealVectorInputs inTargetsMeas[nTargetsMeasTS] if not use_aixcalibuha annotation (Placement(transformation(extent={{-112,-86},{-86,-34}})));
  Interfaces.RealVectorInputs inInputsMeas[nInputsMeasTS] annotation (Placement(transformation(extent={{-112,34},{-86,86}})));
  Interfaces.RealVectorOutputs outTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{88,-26},{114,26}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          textString="[%nInputsMeasTS]",
          extent={{-166,76},{-116,46}},
          lineColor={28,108,200}),                                        Text(
          extent={{-166,-44},{-116,-74}},
          lineColor={28,108,200},
textString=if not use_aixcalibuha then "[%nTargetsMeasTS]" else ""),      Text(
          textString="[%nTargetsSimedTS]",
          extent={{118,16},{168,-14}},
          lineColor={28,108,200})}),                             Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelContainer;
