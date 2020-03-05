within CalibrationTemplates.Container.Internal;
model ModelContainerRouteThrough
  extends CalibrationTemplates.Container.ModelContainer;
equation

  connect(calBusTargetsMeas, calBusTargetSimed) annotation (Line(
      points={{-101,-54},{0,-54},{0,0},{99,0}},
      color={255,204,51},
      thickness=0.5));
end ModelContainerRouteThrough;
