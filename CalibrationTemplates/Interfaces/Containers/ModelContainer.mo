within CalibrationTemplates.Interfaces.Containers;
partial model ModelContainer "Provide common interfaces for all models under calibration"
  replaceable CalibrationTemplates.Interfaces.CalBusTargetsSimed
    calBusTargetSimed constrainedby CalibrationTemplates.Interfaces.CalBusTargetsSimed
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
<p>The ModelContainer is used to provide a common interface for the other models in this framework. By applying the basic structure of a model under calibration, having inputs to the system and simulated targets, the user only has to connect these interfaces with the model.</p>
<p><b>The easiest way to use the ModelContainer is to extend from it.</b> </p>
<p>Call <span style=\"font-family: Courier New;\">extends CalibrationTemplates.Container.ModelContainer</span> in your model and then connect your in- and outputs to the bus connectors.</p>
</html>"));
end ModelContainer;
