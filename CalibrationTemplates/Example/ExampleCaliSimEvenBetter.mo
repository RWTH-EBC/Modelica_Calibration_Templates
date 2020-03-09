within CalibrationTemplates.Example;
model ExampleCaliSimEvenBetter
  extends CalibrationTemplates.Simulator.CalibrationSimulator(
    redeclare ExampleBusDefintion.ExampleCalBusTargetsSimed calBusTargetSimed,
    redeclare ExampleBusDefintion.ExampleCalBusTargetsMeas calBusTargetMeas,
    redeclare ExampleBusDefintion.ExampleCalBusInputs calBusInput,
    redeclare InterfaceRouter.PostProcessor postProcessor,
    redeclare InterfaceRouter.PreProcessor preProcessor,
    fNameTargetsMeas=Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates//Resources//Example_Data//time_series_data_20170613_targetsMeas_manipulated.txt"),
    targetNames={"THCFlo_K"},
    fNameInputsMeas=Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates//Resources//Example_Data//time_series_data_20170613_inputsMeas_manipulated.txt"),
    inputNames={"TEva_degC","THCRet_K"},
    redeclare ExampleDatabase.ExampleTunerParas tunerParameters,
    redeclare AdaptedModelToCalibrate_useExtend modelContainer(
      redeclare ExampleBusDefintion.ExampleCalBusTargetsSimed calBusTargetSimed,
      redeclare ExampleBusDefintion.ExampleCalBusInputs calBusInput,
                                                               k=
          tunerParameters.k));

equation
  connect(tableTargetsMeas.y[1], calBusTargetMeas.THCFlo_K) annotation (Line(
        points={{-159,-50},{-146,-50},{-146,-50},{-130,-50}}, color={0,0,127}));
  connect(tableInputsMeas.y[1], calBusInput.TEva_degC) annotation (Line(points={
          {-159,70},{-140,70},{-140,71},{-129,71}}, color={0,0,127}));
  connect(tableInputsMeas.y[2], calBusInput.THCRet_K) annotation (Line(points={{
          -159,70},{-144,70},{-144,71},{-129,71}}, color={0,0,127}));
  annotation (experiment(StopTime=345610, Tolerance=1e-6));
end ExampleCaliSimEvenBetter;
