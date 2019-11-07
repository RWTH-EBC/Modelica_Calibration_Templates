within ;
package CalibrationTemplates "Library provides templates to extend or use for calibration projects"
annotation (
  version="0.0.2",
  uses(Modelica(version="3.2.3")),
  conversion(from(
      version="0.0.2",
      to="Intermediate",
      change(item=convertClass("CalibrationTemplates.Functions.split_string", "CalibrationTemplates.Functions.splitString")))));
end CalibrationTemplates;
