within CalibrationTemplates.Simulator;
model CalibrationSimulator
  extends Modelica.Icons.Example;

  parameter Integer nTargetsMeasTS(min=1) "Number of measured target time series" annotation(Dialog(group="Number in- and outputs"));
  parameter Integer nTargetsSimedTS(min=1) "Number of simulated target time series" annotation(Dialog(group="Number in- and outputs"));
  parameter Integer nInputsMeasTS(min=1) "Number of measured input time series" annotation(Dialog(group="Number in- and outputs"));

  replaceable Container.ModelContainer modelContainer(
    final nTargetsMeasTS=nTargetsMeasTS,
    final nTargetsSimedTS=nTargetsSimedTS,
    final nInputsMeasTS=nInputsMeasTS)                annotation (Placement(transformation(extent={{-30,2},{30,68}})));
  InterfaceRouter.PreProcessor preProcessor(final nTargetsMeasTS=nTargetsMeasTS, final nInputsMeasTS=nInputsMeasTS)
                                            annotation (Placement(transformation(extent={{-68,-80},{-52,80}})));
  InterfaceRouter.PostProcessor postProcessor(final nTargetsMeasTS=nTargetsMeasTS, final nTargetsSimedTS=nTargetsSimedTS)
                                              annotation (Placement(transformation(extent={{52,-80},{70,80}})));
  Interfaces.RealVectorOutputs outTargetsMeas[nTargetsMeasTS] annotation (Placement(transformation(extent={{88,-86},{114,-34}})));
  Interfaces.RealVectorOutputs outTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{88,34},{114,86}})));
equation
  connect(preProcessor.outInputsMeas, modelContainer.inInputsMeas) annotation (Line(points={{-51.6,48},{-42,48},{-42,54.8},{-29.7,54.8}}, color={0,0,127}));
  connect(preProcessor.outTargetsMeas, modelContainer.inTargetsMeas) annotation (Line(points={{-51.6,-48},{-40,-48},{-40,15.2},{-29.7,15.2}}, color={0,0,127}));
  connect(preProcessor.outTargetsMeas, postProcessor.inTargetsMeas) annotation (Line(points={{-51.6,-48},{1.2,-48},{1.2,-48},{52.45,-48}}, color={0,0,127}));
  connect(modelContainer.outTargetsSimed, postProcessor.inTargetsSimed) annotation (Line(points={{30.3,54.8},{40.15,54.8},{40.15,48},{52.45,48}}, color={0,0,127}));
  connect(postProcessor.outTargetsSimed, outTargetsSimed) annotation (Line(points={{70.45,48},{84,48},{84,60},{101,60}}, color={0,0,127}));
  connect(postProcessor.outTargetsMeas, outTargetsMeas) annotation (Line(points={{70.45,-48},{88,-48},{88,-60},{101,-60}}, color={0,0,127}));
  annotation (Diagram(graphics={Text(
          extent={{-32,0},{32,-62}},
          lineColor={238,46,47},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Tuner Parameters
go inside the
source code")}));
end CalibrationSimulator;
