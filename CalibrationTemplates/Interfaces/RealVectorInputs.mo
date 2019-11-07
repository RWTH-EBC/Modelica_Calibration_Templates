within CalibrationTemplates.Interfaces;
connector RealVectorInputs = input Real "Real input connector used for vector of connectors"
                                                        annotation (
  defaultComponentName="u",
  Icon(graphics={Ellipse(
        extent={{-100,100},{100,-100}},
        lineColor={255,255,255},
        fillColor={0,0,127},
        fillPattern=FillPattern.Solid)}, coordinateSystem(
      extent={{-100,-100},{100,100}},
      preserveAspectRatio=true,
      initialScale=0.2)),
  Diagram(coordinateSystem(
      preserveAspectRatio=false,
      initialScale=0.2,
      extent={{-100,-100},{100,100}}), graphics={
                             Ellipse(
        extent={{-100,100},{100,-100}},
        lineColor={255,255,255},
        fillColor={0,0,127},
        fillPattern=FillPattern.Solid),          Text(
        extent={{-2,15},{-2,-10}},
        lineColor={175,175,175},
        textString="%name")}),
  Documentation(info="<html>
<p>
Real output connector that is used for a vector of connectors,
for example <a href=\"modelica://Modelica.Blocks.Routing.DeMultiplex\">DeMultiplex</a>,
and has therefore a different icon as RealOutput connector.
</p>
</html>"));
