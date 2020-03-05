within CalibrationTemplates.Container;
partial model ModelContainer

  parameter Boolean use_aixcalibuha=false "Whether the models will be used via the AixCaliBuHa-Framework" annotation (choices(checkBox=true));
  parameter String inputNames[:] = {"dummy_variable"} "Names of variables you use as input. The order has to match the order of the connections you draw in this model";

  parameter Integer nTargetsMeasTS(min=1) if not use_aixcalibuha "Number of measured target time series" annotation(Dialog(group="Number in- and outputs", connectorSizing=true, enable=not use_aixcalibuha));

  Interfaces.RealVectorInputs inTargetsMeas[nTargetsMeasTS] if not use_aixcalibuha annotation (Placement(transformation(extent={{-112,-86},{-86,-34}})));
  Interfaces.sigBusCalibration outTargetsSimed
    annotation (Placement(transformation(extent={{78,-20},{120,20}})));
  Interfaces.sigBusCalibration inInputsMeas
    annotation (Placement(transformation(extent={{-120,32},{-78,72}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          textString="[%nInputsMeasTS]",
          extent={{-166,76},{-116,46}},
          lineColor={28,108,200}),                                        Text(
          extent={{-166,-44},{-116,-74}},
          lineColor={28,108,200},
textString=if not use_aixcalibuha then "[%nTargetsMeasTS]" else "")}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelContainer;
