within CalibrationTemplates.InterfaceRouter;
model PreProcessor
  extends BaseClasses.PartialProcessor;

  Interfaces.CalBusInput calBusInputsIn
    annotation (Placement(transformation(extent={{-32,34},{-6,86}})));
  Interfaces.CalBusInput calBusInputsOut
    annotation (Placement(transformation(extent={{8,34},{34,86}})));
equation

  if justPassThrough then
    connect(calBusInputsIn, calBusInputsOut) annotation (Line(
        visible=justPassThrough,
        points={{-19,60},{21,60}},
        color={0,0,127},
        thickness=1));
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}})), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}})),
    Documentation(info="<html>
<p>Connections between in- and outputs must be defined to determine a full model when<span style=\"font-family: Courier New;\"> justPassThrough = false</span>. In other words in this case a section for<span style=\"font-family: Courier New;\"> not justPassThrough </span>must exist.</p>
</html>"));
end PreProcessor;
