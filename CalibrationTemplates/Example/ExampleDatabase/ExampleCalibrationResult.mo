within CalibrationTemplates.Example.ExampleDatabase;
record ExampleCalibrationResult
  "Once you've run a calibration, you can store the result in a record and easily change it"
  extends CalibrationTemplates.Example.ExampleDatabase.ExampleTunerParas(
    k=8.534);

  // Additionaly you may store objective values (like RMSE or similar) and further details of the calibration
end ExampleCalibrationResult;
