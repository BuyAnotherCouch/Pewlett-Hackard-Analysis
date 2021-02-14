# Pewlett-Hackard-Analysis

## Overview
The purpose of this assignment is to assist Bobby, an HR Analyst at Pewlett Hackard, in providing the following information to his manager:

-	The number of retiring employees per title.
-	A list of employees who are eligible to participate in the company’s mentorship program. 

## Results
Using SQL, we were able to organize the Pewlett Hackard’s employee data into tables that identify the employees who are retiring and the employees who are eligible to participate in the mentorship program.

The main challenges faced with these tables were:

-	Managing duplicate data caused by promotions/title changes.
-	Filtering the data to only show the employee’s current title. 

![retirement_titles](/retirement_titles.png)

After addressing these issues, we were able to determine that:

-	There are 90,398 employees who are getting close to retirement.
-	There are 1,549 employees who are eligible to become mentors. 

Breakdowns of the retirement and mentorship data by title are as follows:

- Number of Retiring Employees per Title

![retirement_count](/retirement_count.PNG)

- Number of Eligible Mentors per Title

![mentorship_count](/mentorship_count.PNG)

## Summary
According to our analysis, management may futureproof their organization by preparing to fill the 90,398 positions that will be lost to the “silver tsunami” and preparing all eligible employees to become mentors. One thing that management will need to consider is whether or not employees who are not in senior positions should be mentors for newer hires and if these employees are ready for a promotion.

After comparing the avarage salaries of the retirement group and the new hires from the last full calendar year, management may  need to make adjustments to senior employees' and incoming employees' salaries, as the difference is fairly slim. Retiring Technique Leaders and Engineers also average less than new hires.

- Average 'Silver Tsunami' Salary

![avg_r_salary](/avg_r_salary.PNG)

- Average New Hire Salary

![avg_nh_salary](/avg_nh_salary.PNG)


For a complete list of employees nearing retirement, click ![here](/Data/retirement_titles.csv).

For a complete list of eligible employees for the mentorship program, click ![here](/Data/mentorship_eligibility.csv).
