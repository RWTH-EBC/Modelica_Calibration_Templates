within CalibrationTemplates.Examples.ModelsToCalibrate.ModelsCombined;
model AdaptedModelToCalibrate_useExtendAndCustomBus "Example model: Extend and custom bus method"
  extends CalibrationTemplates.Interfaces.Containers.ModelContainer(
                                                        redeclare
      ExampleBusDefintion.ExampleCalBusInputs calBusInput, redeclare
      ExampleBusDefintion.ExampleCalBusTargetsSimed calBusTargetSimed);
  extends CalibrationTemplates.Examples.ModelsToCalibrate.ModelsPure.ModelToCalibrate;
equation
    connect(gain.y, add.u1) annotation (Line(points={{-18.6,60},{0,60},{0,36},{-20,
          36},{-20,8},{-7,8}}, color={0,0,127}));
  connect(gain.u, calBusInput.TEva_degC) annotation (Line(points={{-50.8,60},{
          -68,60},{-68,0},{-101,0}}, color={0,0,127}));
  connect(add.u2, calBusInput.THCRet_K) annotation (Line(points={{-7,-10},{-40,
          -10},{-40,-8},{-101,-8},{-101,0}}, color={0,0,127}));
  connect(add.y, calBusTargetSimed.THCFlo_K) annotation (Line(points={{27.5,-1},
          {57.75,-1},{57.75,0},{99,0}}, color={0,0,127}));
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end AdaptedModelToCalibrate_useExtendAndCustomBus;
