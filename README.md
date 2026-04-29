# healthcare-sql-analysis
This project analyzes hospital patient flow, wait times, and satisfaction using SQL.

Objectives
- Identify peak patient demand periods
- Evaluate operational performance (wait times)
- Analyze patient satisfaction trends
- Address data quality limitations
  
Key Insights
- Patient demand peaks midday while remaining consistent across days
- Wait times do not significantly differ between peak and off-peak hours
- Patient satisfaction remains low regardless of wait time
- Missing satisfaction data limits analytical conclusions

Tools Used
- SQL (aggregations, CASE statements, filtering)
- Excel (data cleaning)
- Tableau (data visualization)

Data Preparation
- Standardized inconsistent date formats (mixed MM/DD and DD/MM)
- Derived time-based fields (hour of day, peak vs. off-peak) from timestamps
- Handled missing satisfaction data by excluding null values from analysis
- Created categorical groupings for wait time and satisfaction levels to support analysis

Files
- queries.sql → core analysis queries
- Tableau Dashboard → https://public.tableau.com/views/HospitalPatientFlowSatisfactionAnalysis/HospitalPatientFlowSatisfactionAnalysisDashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link<img width="468" height="20" alt="image" src="https://github.com/user-attachments/assets/676c459d-317a-45cf-821d-2824c3bb2346" />
