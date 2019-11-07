within CalibrationTemplates.InterfaceRouter;
model PostProcessor
  extends BaseClasses.PartialProcessor;

  parameter Integer nTargetsSimedTS(min=1) "Number of simulated target time series";
  Interfaces.RealVectorInputs inTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{-32,34},{-6,86}})));
  Interfaces.RealVectorOutputs outTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{8,34},{34,86}})));
equation

  if justPassThrough then
    connect(inTargetsSimed, outTargetsSimed) annotation (Line(
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}}), graphics={Text(
          extent={{-12,14},{14,-12}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="f(x)",
          visible=not justPassThrough)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}})),
    Documentation(info="<html>
<p>Connections between in- and outputs must be defined to determine a full model when<span style=\"font-family: Courier New;\"> justPassThrough = false</span>. In other words in this case a section for<span style=\"font-family: Courier New;\"> not justPassThrough </span>must exist.</p>
</html>"));
end PostProcessor;
