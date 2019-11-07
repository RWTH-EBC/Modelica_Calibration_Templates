within CalibrationTemplates.Simulator;
model CaliSimWithTables
  extends CalibrationSimulator;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile=true) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
end CaliSimWithTables;
