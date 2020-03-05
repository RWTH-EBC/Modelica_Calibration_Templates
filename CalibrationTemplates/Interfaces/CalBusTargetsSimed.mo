within CalibrationTemplates.Interfaces;
expandable connector CalBusTargetsSimed
  "Bus-Connector for target values simulated"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-70,92},{64,62}},
          lineColor={28,108,200},
          textString="%name"),
          Rectangle(
            lineColor={255,204,51},
            lineThickness=0.5,
            extent={{-20.0,-2.0},{20.0,2.0}}),
          Polygon(
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            points={{-80.0,50.0},{80.0,50.0},{100.0,30.0},{80.0,-40.0},{60.0,-50.0},{-60.0,-50.0},{-80.0,-40.0},{-100.0,30.0}},
            smooth=Smooth.Bezier,
          lineColor={0,0,0}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-65.0,15.0},{-55.0,25.0}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-5.0,15.0},{5.0,25.0}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{55.0,15.0},{65.0,25.0}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{-35.0,-25.0},{-25.0,-15.0}}),
          Ellipse(
            fillPattern=FillPattern.Solid,
            extent={{25.0,-25.0},{35.0,-15.0}})}),               Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CalBusTargetsSimed;
