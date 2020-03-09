within CalibrationTemplates.Example;
model AdaptedModelToCalibrate_useCopy "Example model used for calibration"
  extends CalibrationTemplates.Container.ModelContainer;

  Modelica.Blocks.Math.Gain gain(k=k)
    annotation (Placement(transformation(extent={{-48,46},{-20,74}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-4,-16},{26,14}})));
  parameter Real k "Gain value multiplied with input signal";
equation
  connect(gain.y, add.u1) annotation (Line(points={{-18.6,60},{0,60},{0,36},{-20,
          36},{-20,8},{-7,8}}, color={0,0,127}));
  connect(gain.u, calBusInput.TEva_degC) annotation (Line(points={{-50.8,60},{-50.8,
          -4},{-101,-4},{-101,0}}, color={0,0,127}));
  connect(add.y, calBusTargetSimed.TEva_out)
    annotation (Line(points={{27.5,-1},{99,-1},{99,0}}, color={0,0,127}));
  connect(add.u2, calBusInput.THCRet_K) annotation (Line(points={{-7,-10},{-42,-10},
          {-42,-8},{-101,-8},{-101,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-116,-32},{134,-42}},
          lineColor={238,46,47},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Bold},
          textString="NOTE: This is only to show an example, the model itself makes no sense")}));
end AdaptedModelToCalibrate_useCopy;
