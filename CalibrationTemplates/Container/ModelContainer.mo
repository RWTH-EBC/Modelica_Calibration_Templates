within CalibrationTemplates.Container;
partial model ModelContainer "Provide common interfaces for all models under calibration"
  replaceable CalibrationTemplates.Interfaces.CalBusTargetsSimed
    calBusTargetSimed constrainedby
    CalibrationTemplates.Interfaces.CalBusTargetsSimed
    "Replacable connector for simulated Target Values (outputs)"
                                                       annotation (
      choicesAllMatching=true, Placement(transformation(extent={{78,-20},{120,
            20}})));
  replaceable CalibrationTemplates.Interfaces.CalBusInputs calBusInput
    constrainedby CalibrationTemplates.Interfaces.CalBusInputs
    "Replacable connector for Inputs to the System"            annotation (
      choicesAllMatching=true, Placement(transformation(extent={{-122,-20},{-80,
            20}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The ModelContainer is used to provide a common interface for the other models in this framework. By applying the basic structure of a model under Calibration, having Inputs to the System and simulated target, the user only has to connect these interfaces with the model.</p>
<p>The easiest way to use the ModelContainer is to extend from it. Call <i>extends CalibrationTemplates.Container.ModelContainer</i> in your model and then connect your in- and outputs to the bus-connectors.</p>
</html>"));
end ModelContainer;
