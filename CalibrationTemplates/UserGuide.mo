within CalibrationTemplates;
class UserGuide "User's Guide"
  extends Modelica.Icons.Information;

annotation(preferredView="info", DocumentationClass=true,
    Documentation(info="<html>
<h4>TODO: Add step-by-step introduction how to setup a calibration model</h4>
<p>Main sections might be:</p>
<p>(0. Specify inputs and outputs as well as tuner paramters on a blank paper)</p>
<p>1. Create your calibration model:</p>
<ol>
<li>extend ModelContainer (and extend Bus) and connect in/outputs</li>
<li>extend CalibrationSimulator and connect file inputs</li>
<li>extend tuner parameters and add all</li>
<li>explain briefly Evaluate and how we manage it (copy from paper)</li>
</ol>
<p>2. Pre-/Post-processing:</p>
<ol>
<li>Show ideas what you may want to pre-/postprocess</li>
<li>Show plots for an example</li>
</ol>
<p>3. Refer to AixCaliBuHa for the deployment of the calibration. Additionally mention &quot;sweep parameters&quot; function and/or &quot;Design&quot; library of Dymola.</p>
</html>"));
end UserGuide;
