within CalibrationTemplates.Simulator.Examples;
model CaliSimWithTables
  extends CalibrationTemplates.Simulator.CaliSimWithTables(
    redeclare Container.Internal.ModelContainerRouteThrough modelContainer,
    nInputsMeasTS=6,
    nTargetsSimedTS=1,
    nTargetsMeasTS=1,
    fNameInputsMeas = Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates/Resources/Example_Data/time_series_data_20170613_inputsMeas_manipulated.txt"),
    fNameTargetsMeas = Modelica.Utilities.Files.loadResource("modelica://CalibrationTemplates/Resources/Example_Data/time_series_data_20170613_targetsMeas_manipulated.txt"));
  annotation (experiment(StopTime=345610, Tolerance=1e-6));
end CaliSimWithTables;
