within CalibrationTemplates.Simulator;
model CalibrationSimulator
  extends Modelica.Icons.Example;

  /////////////////////////////////
  // TUNER PARAMETERS /////////////
  /////////////////////////////////
  // DO NOT FORGET: ///////////////
  // set all parameters: //////////
  // annotation(Evaluate=false); //
  /////////////////////////////////


  replaceable
  InterfaceRouter.PreProcessor preProcessor(nTargetsMeasTS=nTargetsMeasTS, nInputsMeasTS=nInputsMeasTS) constrainedby
    InterfaceRouter.PreProcessor(                                                                                                                  nTargetsMeasTS=nTargetsMeasTS, nInputsMeasTS=nInputsMeasTS)
                                            annotation (Placement(transformation(extent={{-68,-80},{-52,80}})), choicesAllMatching=true);
  replaceable Container.ModelContainer modelContainer(
    final nTargetsMeasTS=nTargetsMeasTS,
    final nTargetsSimedTS=nTargetsSimedTS,
    final nInputsMeasTS=nInputsMeasTS)                annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,2},{30,68}})));
  replaceable
  InterfaceRouter.PostProcessor postProcessor(nTargetsMeasTS=nTargetsMeasTS, nTargetsSimedTS=nTargetsSimedTS) constrainedby
    InterfaceRouter.PostProcessor(                                                                                                                        nTargetsMeasTS=nTargetsMeasTS, nTargetsSimedTS=nTargetsSimedTS)
                                              annotation (Placement(transformation(extent={{52,-80},{70,80}})), choicesAllMatching=true);
  Interfaces.CalBusTargetMeas  outTargetsMeas[nTargetsMeasTS] annotation (Placement(transformation(extent={{88,-86},{114,-34}})));
  Interfaces.CalBusTargetSimed outTargetsSimed[nTargetsSimedTS] annotation (Placement(transformation(extent={{88,34},{114,86}})));
equation
  connect(preProcessor.outInputsMeas,modelContainer.calBusInputs)  annotation (Line(points={{-51.6,
          48},{-42,48},{-42,52.16},{-29.7,52.16}},                                                                                        color={0,0,127}));
  connect(preProcessor.outTargetsMeas, modelContainer.inTargetsMeas) annotation (Line(points={{-51.6,-48},{-40,-48},{-40,15.2},{-29.7,15.2}}, color={0,0,127}));
  connect(postProcessor.outTargetsMeas, outTargetsMeas) annotation (Line(
      points={{70.45,-48},{82,-48},{82,-60},{101,-60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(postProcessor.inTargetsMeas, preProcessor.outTargetsMeas) annotation (
     Line(
      points={{52.45,-48},{2,-48},{2,-48},{-51.6,-48}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(postProcessor.outTargetsSimed, outTargetsSimed) annotation (Line(
      points={{70.45,48},{88,48},{88,60},{101,60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(modelContainer.calBusTargetSimed, postProcessor.inTargetsSimed)
    annotation (Line(
      points={{29.7,35},{39.85,35},{39.85,48},{52.45,48}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.Bezier));
  annotation (Diagram(graphics={Text(
          extent={{-32,0},{32,-62}},
          lineColor={238,46,47},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Tuner Parameters
go inside the
source code")}), Documentation(info="<html>
<p><span style=\"font-family: Courier New;\">  /////////////////////////////////</span></p>
<p><span style=\"font-family: Courier New;\">  // TUNER PARAMETERS /////////////</span></p>
<p><span style=\"font-family: Courier New;\">  /////////////////////////////////</span></p>
<p><span style=\"font-family: Courier New;\">  // DO NOT FORGET: ///////////////</span></p>
<p><span style=\"font-family: Courier New;\">  // set all parameters: //////////</span></p>
<p><span style=\"font-family: Courier New;\">  // annotation(Evaluate=false); //</span></p>
<p><span style=\"font-family: Courier New;\">  /////////////////////////////////</span></p>
</html>"));
end CalibrationSimulator;
