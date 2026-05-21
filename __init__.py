"""
InspectionFlow Engine - Industrial Inspection & QA Report Automation System for NDT workflows

A comprehensive Python library for automating industrial inspection workflows and 
generating professional QA reports for Non-Destructive Testing (NDT) processes.

Example:
    >>> from inspectionflow import InspectionFlow, Inspector
    >>> inspector = Inspector(name="John Doe", certification="ASNT Level III")
    >>> inspection = InspectionFlow(name="Ultrasonic Testing", inspector=inspector)
    >>> inspection.add_measurement("Wall Thickness", 5.2, "mm", min_spec=5.0, max_spec=6.0)
    >>> if inspection.validate():
    ...     report = inspection.generate_report(format="pdf")
    ...     report.save("report.pdf")
"""

__title__ = "inspectionflow-engine"
__version__ = "0.1.0"
__author__ = "Maximiliano Gross"
__email__ = "your.email@example.com"
__license__ = "MIT"
__description__ = "Industrial Inspection & QA Report Automation System for NDT workflows"

# Version info
VERSION = __version__

# Import main classes for easy access
from .core.inspection import InspectionFlow
from .core.inspector import Inspector
from .core.measurements import Measurement, MeasurementPoint
from .workflows.builder import WorkflowBuilder
from .workflows.rules import QualityRule, Rule
from .reports.generator import Report, ReportGenerator

__all__ = [
    "InspectionFlow",
    "Inspector",
    "Measurement",
    "MeasurementPoint",
    "WorkflowBuilder",
    "QualityRule",
    "Rule",
    "Report",
    "ReportGenerator",
    "__version__",
    "__author__",
]
