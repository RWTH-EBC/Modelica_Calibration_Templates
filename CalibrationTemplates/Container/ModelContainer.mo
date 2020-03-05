within CalibrationTemplates.Container;
partial model ModelContainer
  replaceable CalibrationTemplates.Interfaces.CalBusTargetsSimed
    calBusTargetSimed constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetsSimed annotation (
      choicesAllMatching=true, Placement(transformation(extent={{78,-20},{120,
            20}})));
  replaceable CalibrationTemplates.Interfaces.CalBusInputs calBusInput
    constrainedby CalibrationTemplates.Interfaces.CalBusInputs annotation (
      choicesAllMatching=true, Placement(transformation(extent={{-122,-20},{-80,
            20}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelContainer;
