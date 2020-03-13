within CalibrationTemplates.Example.ExampleDatabase;
record ExampleTunerParas
  "Example to show how to use and extend the base record to appear in choicable list"
  extends CalibrationTemplates.Database.TunerParameterBaseDataDefinition;

  parameter Real k=10 "Gain Value";

end ExampleTunerParas;
