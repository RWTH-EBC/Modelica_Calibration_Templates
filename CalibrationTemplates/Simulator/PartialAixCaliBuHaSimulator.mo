within CalibrationTemplates.Simulator;
partial model PartialAixCaliBuHaSimulator
  extends CalibrationTemplates.Simulator.PartialCalibrationSimulator;

equation

  connect(modelContainer.calBusTargetSimed, calBusTargetSimed) annotation (Line(
      points={{25.75,-1},{90,-1},{90,70},{158,70}},
      color={255,204,51},
      thickness=0.5));
  connect(calBusInput, modelContainer.calBusInput) annotation (Line(
      points={{-129,71},{-92,71},{-92,13.04},{-23.75,13.04}},
      color={255,204,51},
      thickness=0.5));
end PartialAixCaliBuHaSimulator;
