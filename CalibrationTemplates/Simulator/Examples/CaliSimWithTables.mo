within CalibrationTemplates.Simulator.Examples;
model CaliSimWithTables
  extends CalibrationTemplates.Simulator.PartialCalibrationSimulatorModelica(
      redeclare Container.Internal.ModelContainerRouteThrough modelContainer);
  annotation (experiment(StopTime=345610, Tolerance=1e-6));
end CaliSimWithTables;
