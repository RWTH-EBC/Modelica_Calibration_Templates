within CalibrationTemplates.Examples.ExampleBusDefintion;
expandable connector ExampleCalBusInputs
  "Used to show how to use the bus as replaceable connector"
  extends Interfaces.CalBusInputs;

  Modelica.SIunits.Conversions.NonSIunits.Temperature_degC TEva_degC;
  Modelica.SIunits.Conversions.NonSIunits.Temperature_degC THCRet_K;

end ExampleCalBusInputs;
