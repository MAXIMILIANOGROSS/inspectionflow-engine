{
  "project": "Pipeline Weld Inspection",
  "inspector": "Maximiliano Olmos",
  "method": "RT",
  "date": "2026-01-21",
  "findings": "No critical defects detected. Weld integrity acceptable according to ISO standards."

---

# 🟢 3. core/pdf_generator.py

📄 Archivo: `core/pdf_generator.py`

```python id="core1"
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from datetime import datetime
import os


def generate_report(data, output_path):
    file_name = f"inspection_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.pdf"
    full_path = os.path.join(output_path, file_name)

    c = canvas.Canvas(full_path, pagesize=A4)
    width, height = A4

    # HEADER
    c.setFont("Helvetica-Bold", 16)
    c.drawString(50, height - 50, "Industrial Inspection Report")

    # DATA
    c.setFont("Helvetica", 10)
    c.drawString(50, height - 80, f"Project: {data.get('project','')}")
    c.drawString(50, height - 100, f"Inspector: {data.get('inspector','')}")
    c.drawString(50, height - 120, f"Method: {data.get('method','')}")
    c.drawString(50, height - 140, f"Date: {data.get('date','')}")

    # FINDINGS
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, height - 180, "Findings:")

    c.setFont("Helvetica", 10)
    text = c.beginText(50, height - 200)
    text.textLines(data.get('findings', ''))
    c.drawText(text)

    # FOOTER
    c.setFont("Helvetica-Oblique", 8)
    c.drawString(50, 50, f"Generated: {datetime.now()}")

    c.save()

    return full_path}