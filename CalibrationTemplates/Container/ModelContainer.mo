within CalibrationTemplates.Container;
partial model ModelContainer

  parameter Boolean use_aixcalibuha=false "Whether the models will be used via the AixCaliBuHa-Framework" annotation (choices(checkBox=true));
  parameter String inputNames[:] = {"dummy_variable"} "Names of variables you use as input. The order has to match the order of the connections you draw in this model";

  replaceable CalibrationTemplates.Interfaces.CalBusTargetSimed calBusTargetSimed constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetSimed
    annotation (choicesAllMatching=true, Placement(transformation(extent={{78,-20},{120,20}})));
  replaceable CalibrationTemplates.Interfaces.CalBusInput calBusInput constrainedby
    CalibrationTemplates.Interfaces.CalBusInput
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-120,32},{-78,72}})));
  replaceable CalibrationTemplates.Interfaces.CalBusTargetMeas calBusTargetMeas constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetMeas
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-122,-74},{-80,-34}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelContainer;
