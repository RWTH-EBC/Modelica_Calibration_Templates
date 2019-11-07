within CalibrationTemplates.Container.Internal;
model ModelContainerRouteThrough
  extends ModelContainer;
equation
  connect(inTargetsMeas, outTargetsSimed) annotation (Line(points={{-99,-60},{-2,-60},{-2,0},{101,0}}, color={0,0,127}));
end ModelContainerRouteThrough;
