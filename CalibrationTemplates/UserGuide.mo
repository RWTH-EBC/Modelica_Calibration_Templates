within CalibrationTemplates;
package UserGuide "User's Guide"
  extends Modelica.Icons.Information;

  class setup_mocate "Setting up MoCaTe"
    annotation (preferredView="info", DocumentationClass=true,
      Documentation(info="<html>
<p>We guide you through the process of setting up the library and towards performing the calibration step by step.</p>
<p>Before we may start we emphasize the importance of step 0:</p>
<h4>Step 0: Know your system</h4>
<p>Please take the time and write down:</p>
<ul>
<li>What are the inputs and outputs of the system i am modelling</li>
<li>Which are parameters do i know / can measure, which parameters need calibration</li>
<li>What measurements are available? To calibrate, you need the measurement data from an experiment. If your testbench e.g. has no sensor for system pressure but your models requires it, you have to think about how you get the available measurements converted to something useful for the model. You may you <a href=\"CalibrationTemplates.UserGuide.Processing\">pre- and postprocessing</a> tools to do this.</li>
</ul>
<p>Also, you should know the basic idea behind calibration and methods available to perform one.</p>
<h4>Step 1: Create your calibration model</h4>
<p>Note: All steps are done for the Examples available in this package. Have a look at them <a href=\"CalibrationTemplates.Examples\">here</a>: </p>
<p>Assuming you have a model with the name <a href=\"CalibrationTemplates.Examples.ModelsToCalibrate.ModelsPure.ModelToCalibrate\">ModelToCalibrate</a> you want to calibrate:</p>
<ol>
<li>Create a new, empty model</li>
<li>Put in the lines: <br><span style=\"font-family: Courier New;\">extends CalibrationTemplates.Interfaces.Containers.ModelContainer;<br>extends ModelToCalibrate;</span></li>
<li>Now, in the Diagram section: connect the inputs of your system to the bus <a href=\"CalibrationTemplates.Interfaces.CalBusInputs\">CalBusInputs</a> and the outputs to <a href=\"CalibrationTemplates.Interfaces.CalBusTargetsSimed\">CalBusTargetsSimed</a></li>
<li>When connecting, a pop up will appear enabling to name the variable inside the bus. You may also create your own bus connector which inherites from the <a href=\"CalibrationTemplates.Interfaces.CalBusInputs\">default one</a>. Then you can select your newly created connector in the parameter section of you model.</li>
</ol>
<p>You can also directly extend you model from the ModelContainer. Also, you may define your own Bus connectors wich inherit from the ones mentioned above to avoid naming confusion.</p>
<h5>Examples:</h5>
<ul>
<li><a href=\"CalibrationTemplates.Examples.ModelsToCalibrate.ModelsCombined.AdaptedModelToCalibrate_useExtend\">Using both extends</a></li>
<li><a href=\"CalibrationTemplates.Examples.ModelsToCalibrate.ModelsCombined.AdaptedModelToCalibrate_useCopy\">Copying the code</a></li>
<li><a href=\"CalibrationTemplates.Examples.ModelsToCalibrate.ModelsCombined.AdaptedModelToCalibrate_useExtendAndCustomBus\">Using own interfaces</a></li>
<li>Defining own interfaces: <a href=\"CalibrationTemplates.Interfaces.CalBusInputs\">Inputs</a>, <a href=\"CalibrationTemplates.Interfaces.CalBusTargetsMeas\">TargetsMeas</a>, <a href=\"CalibrationTemplates.Interfaces.CalBusTargetsSimed\">TargetsSimed</a></li>
</ul>
<h4>Step 2: Create the tuner parameters</h4>
<p>From step 0 you should know which parameters you want to calibrate.</p>
<p>Propagate all these parameters to the top level of <span style=\"font-family: Courier New;\">MyModel</span>. Then, copy the definitions into a new record which extends from <a href=\"CalibrationTemplates.Database.TunerParameterBaseDataDefinition\">TunerParameterBaseDataDefinition</a>.</p>
<p><b><span style=\"font-size: 7pt;\">Examples:</span></b> <a href=\"CalibrationTemplates.Examples.ExampleDatabase.ExampleTunerParas\">Own tuner paramter record</a></p>
<h4>Step 3: Setup the CalibrationSimulator</h4>
<p>Now:</p>
<ul>
<li>Create a new model which extends <a href=\"CalibrationTemplates.SimulatorTemplates.CalibrationSimulator\">CalibrationSimulator</a>. </li>
<li>Select the newly created models in the parameter section</li>
<li>Add the filenames (.txt) where the measured input and measured target data is stored. We supported automated matching of columns using the parameter `inputNames`. An example for the .txt file is provided in the Resources folder of this library.</li>
</ul>
<h5>Examples: </h5>
<ul>
<li><a href=\"CalibrationTemplates.Examples.ExampleCaliSim\">Without own interfaces</a></li>
<li><a href=\"CalibrationTemplates.Examples.ExampleCaliSimEvenBetter\">With own interfaces</a></li>
</ul>
<p><br>Step 4: Simulate and Calibrate</p>
<p><br>You can now try and simulate the newly created model. Check if everyhing behaves as intented. Then, use one of the <a href=\"CalibrationTemplates.UserGuide.CalibrationTools\">provided tools</a> to perform the calibration. </p>
</html>"));
  end setup_mocate;

  class Processing "Pre- and Postprocessing"
    annotation (preferredView="info", DocumentationClass=true,
      Documentation(info="<html>
<p>2. Pre-/Post-processing:</p>
<p>Show ideas what you may want to pre-/postprocess</p>
<p>Show plots for an example</p>
</html>"));
  end Processing;

  class CalibrationTools "List of calibration tools"
    annotation (preferredView="info", DocumentationClass=true,
      Documentation(info="<html>
<p><br>We mainly differ between tools inside the Dymola enviroment and external ones. For more info on how to use each tool, we refer to the corresponding documentation.</p>
<p><b>Note:</b> Our dynamic approach on bus interfaces and input tables is not supported by the latest OpenModelica version. However, we will list the known possiblities for calibration in OM as well.</p>
<h4>Dymola</h4>
<ul>
<li><a href=\"https://www.3ds.com/fileadmin/PRODUCTS/CATIA/DYMOLA/PDF/Dymola-sweep-parameters.pdf\">Sweep Parameters</a>: Only parameter variation, no actual optimization</li>
<li><a href=\"https://www.systemcontrolinnovationlab.de/the-dlr-optimization-library/\">Optimization Library</a> (Load via: File -&gt; Libraries -&gt; Optimization): By DLR, could be used for calibration</li>
<li>Design Library (Load via: File -&gt; Libraries -&gt; Design): Able to calibrate a model</li>
</ul>
<h4>External</h4>
<ul>
<li>python: <a href=\"https://git.rwth-aachen.de/EBC/EBC_all/Optimization-and-Calibration/AixCaliBuHA\">AixCaliBuHA</a> tool for automated calibration of simulation models. We provide an interface from this library to ease the coupling of Modelica models and the python optimization. We also provide methods for time series analysis and sensitivity analysis</li>
</ul>
<h4>OpenModelica </h4>
<ul>
<li><a href=\"https://openmodelica.org/research/omoptim\">OMOptim</a> </li>
</ul>
<p><br>If you know other tools, please let us know so we can extend the list!</p>
</html>"));
  end CalibrationTools;

  class structural_parameters "Structural Parameters"
    annotation (preferredView="info", DocumentationClass=true,
      Documentation(info="<html>
<p>The calabriation process changes the chosen tuner parameters for each simulation during the optimizer is running. It is strongly recommended to choose only paramters that are <b>not structural parameters</b>! (Structural parameters influence the DAE system, which cannot be changed after compilation). It is possible, but each optimization step, the simulation model must be translated again (not just simulated with new paramter values). This <b>slows</b> the process extremly down. You would have to add in the Modelica code <span style=\"font-family: Courier New;\">annotation(Evaluate=false)</span> behind the parameters that are of interest for your calibration. For this library, we handeld the problem by setting the record <a href=\"CalibrationTemplates.Database.TunerParameterBaseDataDefinition\">TunerParameterBaseDataDefinition</a> to <span style=\"font-family: Courier New;\">Evaluate=false</span>. However, not all parameters can be converted into non-structural ones (e.g. if an integer determines geometric informations like the number of layers in a tank). Also use the Dymola flag <span style=\"font-family: Courier New;\">Advanced.LogStructuredEvaluation = true</span> (p. 630 Dymola User Manual Volume 1) to receive further information in the log file and the translation tab.</p>
</html>"));
  end structural_parameters;

  class Contact "Contact"
    extends Modelica.Icons.Contact;
    annotation (preferredView="info", DocumentationClass=true,
      Documentation(info="<html>
<p>The development of the MoCaTe was initiated by researchers at the Institute for Energy Efficient Buildings and Indoor Climate of the RWTH Aachen.</p>
<p>For contact, please raise an issue in the git repository or write the developers.</p>
</html>"));
  end Contact;
annotation(preferredView="info", DocumentationClass=true,
    Documentation(info="<html>
<p>The library Modelica Calibration Templates (MoCaTe) aims to guide users through the process of calibrating a modelica model. While there are many tools inside and outside of Modelica to perform the actual calibration (<a href=\"CalibrationTemplates.UserGuide.CalibrationTools\">see the list</a>), the correct setup of a model prior to the calibration is crucial. Providing common interfaces, this task is simplified using MoCaTe. </p>
<p>To help you get started, we refer to the user guide on <a href=\"CalibrationTemplates.UserGuide.setup_mocate\">how to set up MoCaTe</a>. </p><p>Furthermore, we provide info on:</p>
<ul>
<li><a href=\"CalibrationTemplates.UserGuide.Processing\">Pre- and postprocessing your input and output data</a></li>
<li><a href=\"CalibrationTemplates.UserGuide.CalibrationTools\">Performing the calibration with an existing, automated framework</a></li>
<li><a href=\"CalibrationTemplates.UserGuide.structural_parameters\">Choosing non structural parameters for the calibration </a></li>
</ul>
</html>"));
end UserGuide;
