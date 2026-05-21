import streamlit as st
import json
import os
from core.pdf_generator import generate_report

OUTPUT_DIR = "output"
os.makedirs(OUTPUT_DIR, exist_ok=True)

st.title("InspectionFlow Engine")
st.write("Industrial QA / NDT Report Automation MVP")

default_json = {
    "project": "Turbine Inspection",
    "inspector": "Maximiliano Olmos",
    "method": "UT",
    "date": "2026-01-01",
    "findings": "No defects detected. System is within acceptable limits."
}

json_input = st.text_area("Inspection Data (JSON)", json.dumps(default_json, indent=4), height=250)

if st.button("Generate Report"):
    try:
        data = json.loads(json_input)

        file_path = generate_report(data, OUTPUT_DIR)

        st.success("Report generated successfully!")

        with open(file_path, "rb") as f:
            st.download_button(
                label="Download PDF",
                data=f,
                file_name="inspection_report.pdf",
                mime="application/pdf"
            )

    except Exception as e:
        st.error(str(e))