within CalibrationTemplates.Simulator.Internal;
partial model PartialAixCaliBuHaSimulator "Used by the AixCaliBuHa-Framework only"
  extends
    CalibrationTemplates.Simulator.BaseClasses.PartialCalibrationSimulator;

equation

  connect(modelContainer.calBusTargetSimed, calBusTargetSimed) annotation (Line(
      points={{25.75,-1},{90,-1},{90,70},{158,70}},
      color={255,204,51},
      thickness=0.5));
  connect(calBusInput, modelContainer.calBusInput) annotation (Line(
      points={{-129,71},{-92,71},{-92,-1},{-24.25,-1}},
      color={255,204,51},
      thickness=0.5));
end PartialAixCaliBuHaSimulator;
