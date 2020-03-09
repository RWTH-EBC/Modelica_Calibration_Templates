within CalibrationTemplates;
class UserGuide "User's Guide"
  extends Modelica.Icons.Information;

annotation(preferredView="info", DocumentationClass=true,
    Documentation(info="<html>
<h4>TODO: Add step-by-step introduction how to setup a calibration model</h4>
<p>Main sections may be:</p>
<p>(0. Specify inputs and outputs as well as tuner-paramters on a blank-paper)</p>
<p>1. Create your Calibration Model:</p>
<p>- extend ModelContainer (and extend Bus) and connect in/outputs</p>
<p>- extend CalibrationSimulator and connect file-inputs</p>
<p>- extend tuner-parameters and add all</p>
<p>- Explain briefly Evaluate and how we manage it (copy from paper)</p>
<p>2. Pre-/Post-processing:</p>
<p>- Show ideas what you may want to pre/postprocess</p>
<p>3. Refer to sweep-parameters and/or AixCaliBuHa for the deployment of the Calibration.</p>
</html>"));
end UserGuide;
