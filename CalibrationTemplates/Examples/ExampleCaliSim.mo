within CalibrationTemplates.Examples;
model ExampleCaliSim
  extends CalibrationTemplates.SimulatorTemplates.CalibrationSimulator(
    redeclare InterfaceRouters.PostProcessor postProcessor,
    redeclare InterfaceRouters.PreProcessor preProcessor,
    fNameTargetsMeas=Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates//Resources//Example_Data//time_series_data_20170613_targetsMeas_manipulated.txt"),
    targetNames={"THCRet_K"},
    fNameInputsMeas=Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates//Resources//Example_Data//time_series_data_20170613_inputsMeas_manipulated.txt"),
    inputNames={"TEva_degC","THCRet_K"},
    redeclare ExampleDatabase.ExampleTunerParas tunerParameters,
    redeclare ModelsToCalibrate.ModelsCombined.AdaptedModelToCalibrate_useExtend modelContainer(k=tunerParameters.k));

equation
  connect(tableInputsMeas.y[2], calBusInput.THCRet_K) annotation (Line(points={{-159,70},
          {-156,70},{-156,48},{-130,48},{-130,71},{-129,71}},          color={0,
          0,127}));
  connect(tableTargetsMeas.y[1], calBusTargetMeas.THCFlo_K) annotation (Line(
        points={{-159,-50},{-144,-50},{-144,-50},{-130,-50}}, color={0,0,127}));
  connect(tableInputsMeas.y[1], calBusInput.TEva_degC) annotation (Line(points={{-159,70},
          {-156,70},{-156,98},{-152,98},{-130,98},{-130,71},{-140,71},{-129,71}},
                                                     color={0,0,127}));
  annotation (experiment(StopTime=345610, Tolerance=1e-6));
end ExampleCaliSim;
