within CalibrationTemplates.InterfaceRouters.BaseClasses;
partial model PartialProcessor

  parameter Boolean justPassThrough=true "Set to false if calculations should be performed" annotation(Evaluate = true);

  Interfaces.CalBusTargetsMeas calBusTargetsMeasIn
    annotation (Placement(transformation(extent={{-32,-86},{-6,-34}})));
  Interfaces.CalBusTargetsMeas calBusTargetsMeasOut
    annotation (Placement(transformation(extent={{8,-86},{34,-34}})));
equation
  if justPassThrough then
    connect(calBusTargetsMeasIn, calBusTargetsMeasOut) annotation (Line(
        visible=justPassThrough,
        points={{-19,-60},{-1.5,-60},{-1.5,-60},{21,-60}},
        color={0,0,127},
        thickness=1));
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}}), graphics={
        Rectangle(
          extent={{-20,100},{20,-100}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-6,84},{8,84},{4,78},{8,84},{4,90}},
          color={0,0,127},
          thickness=1,
          visible=justPassThrough),
        Line(
          points={{-6,48},{8,48},{4,42},{8,48},{4,54}},
          color={0,0,127},
          thickness=1,
          visible=justPassThrough),
        Line(
          points={{-6,-84},{8,-84},{4,-90},{8,-84},{4,-78}},
          color={0,0,127},
          thickness=1,
          visible=justPassThrough),
        Line(
          points={{-6,-48},{8,-48},{4,-54},{8,-48},{4,-42}},
          color={0,0,127},
          thickness=1,
          visible=justPassThrough),
        Text(
          extent={{-12,14},{14,-12}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="f(x)",
          visible=not justPassThrough)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-100},{20,100}}), graphics={Text(
          extent={{-56,30},{56,-30}},
          lineColor={0,0,0},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          textString="Calculations",
          origin={0,0},
          rotation=90)}));
end PartialProcessor;
