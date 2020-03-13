within CalibrationTemplates.Database;
partial record TunerParameterBaseDataDefinition
  extends Modelica.Icons.Record;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Base data definition for tuner parameters. This is an empty record only to ensure the option <i>choicesAllMatching=true</i> won&apos;t show all records currently loaded but only the tuner parameters.</p>
</html>"));
end TunerParameterBaseDataDefinition;
