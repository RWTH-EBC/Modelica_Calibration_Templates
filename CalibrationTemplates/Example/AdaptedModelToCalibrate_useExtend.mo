within CalibrationTemplates.Example;
model AdaptedModelToCalibrate_useExtend
  "Example model used for calibration"
  extends CalibrationTemplates.Container.ModelContainer;
  extends CalibrationTemplates.Example.ModelToCalibrate;
equation
    connect(gain.y, add.u1) annotation (Line(points={{-18.6,60},{0,60},{0,36},{-20,
          36},{-20,8},{-7,8}}, color={0,0,127}));
  connect(add.y, calBusTargetSimed.THCFlo_K) annotation (Line(points={{27.5,-1},
          {54.75,-1},{54.75,0},{99,0}}, color={0,0,127}));
  connect(gain.u, calBusInput.TEva_degC) annotation (Line(points={{-50.8,60},{
          -60,60},{-60,-2},{-101,-2},{-101,0}}, color={0,0,127}));
  connect(add.u2, calBusInput.THCRet_K) annotation (Line(points={{-7,-10},{-46,
          -10},{-46,0},{-101,0}}, color={0,0,127}));
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end AdaptedModelToCalibrate_useExtend;
