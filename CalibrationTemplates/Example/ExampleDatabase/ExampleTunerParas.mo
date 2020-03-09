within CalibrationTemplates.Example.ExampleDatabase;
record ExampleTunerParas
  extends CalibrationTemplates.Database.TunerParameterBaseDataDefinition;

  parameter Real k=10 "Gain Value";

end ExampleTunerParas;
