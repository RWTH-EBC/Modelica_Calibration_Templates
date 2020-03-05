within CalibrationTemplates.InterfaceRouter;
model PreProcessor
  extends BaseClasses.PartialProcessor;

  parameter Integer nInputsMeasTS(min=1) "Number of measured input time series";
  Interfaces.CalBusInput inInputsMeas
    annotation (Placement(transformation(extent={{-32,34},{-6,86}})));
  Interfaces.CalBusInput outInputsMeas
    annotation (Placement(transformation(extent={{8,34},{34,86}})));
equation

  if justPassThrough then
    connect(inInputsMeas, outInputsMeas) annotation (Line(
        visible=justPassThrough,
        points={{-19,60},{21,60}},
        color={0,0,127},
        thickness=1));
    connect(inTargetsMeas, outTargetsMeas) annotation (Line(
        visible=justPassThrough,
        points={{-19,-60},{-1.5,-60},{-1.5,-60},{21,-60}},
        color={0,0,127},
        thickness=1));
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}})), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}})),
    Documentation(info="<html>
<p>Connections between in- and outputs must be defined to determine a full model when<span style=\"font-family: Courier New;\"> justPassThrough = false</span>. In other words in this case a section for<span style=\"font-family: Courier New;\"> not justPassThrough </span>must exist.</p>
</html>"));
end PreProcessor;
