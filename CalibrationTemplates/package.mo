within ;
package CalibrationTemplates "Library provides templates to extend or use for calibration projects"
annotation (
  version="0.0.1",
  uses(Modelica(version="3.2.3")),
  conversion(from(
      version="0.0.1",
      to="Intermediate",
      change(
        item=convertClass("CalibrationTemplates.Interfaces.RealVectorOutput", "CalibrationTemplates.Interfaces.RealVectorOutputs"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "u",
            "inputsMeas"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "y",
            "yInputsMeas"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "inputsMeas",
            "inInputsMeas"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "yInputsMeas",
            "outInputsMeas"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "inInputsMeas1",
            "inTargetsMeas"),
        item=convertElement(
            "CalibrationTemplates.PreProcessor",
            "outInputsMeas1",
            "outTargetsMeas"),
        item=convertElement(
            "CalibrationTemplates.PostProcessor",
            "inInputsMeas",
            "inTargetsSimed"),
        item=convertElement(
            "CalibrationTemplates.PostProcessor",
            "outInputsMeas",
            "outTargetsSimed"),
        item=convertClass("CalibrationTemplates.PartialProcessor", "CalibrationTemplates.BaseClasses.PartialProcessor"),
        item=convertClass("CalibrationTemplates.PreProcessor", "CalibrationTemplates.InterfaceRouter.PreProcessor"),
        item=convertClass("CalibrationTemplates.PostProcessor", "CalibrationTemplates.InterfaceRouter.PostProcessor"),
        item=convertClass("CalibrationTemplates.BaseClasses", "CalibrationTemplates.InterfaceRouter.BaseClasses"),
        item=convertElement(
            "CalibrationTemplates.InterfaceRouter.PostProcessor",
            "inInputsMeas",
            "inTargetsSimed"),
        item=convertElement(
            "CalibrationTemplates.InterfaceRouter.PostProcessor",
            "outInputsMeas",
            "outTargetsSimed"),
        item=convertClass("CalibrationTemplates.ModelContainer", "CalibrationTemplates.Container.ModelContainer")))));
end CalibrationTemplates;
