use loan_default_analysis
select * from LoanData

--Overall Default Rate 
select DefaultStatus,
count(*) as TotalLoans,
ROUND(COUNT(*) * 100.00 / (SELECT COUNT(*) FROM LoanData), 2) AS Percentage
from LoanData
group by DefaultStatus

--Default Rate by Income Group
select IncomeGroup,
count(*) as TotalLoans,
sum(
	case 
		when DefaultStatus='Yes' then 1		
		else 0 
		end) as Defaults,
		Round(
		sum(case when DefaultStatus ='Yes' then 1 else 0 end)*100.0/count(*),2
		) as DefaultsPercentage
from LoanData
group by IncomeGroup
order by defaults desc

-- Default Rate by Credit Score
select CreditScoreGroup,
count(*) as TotalLoans,
sum(
	Case 
		when DefaultStatus='Yes' Then 1 
		else 0
		end) as Defaults,
		round(
			sum(Case when DefaultStatus='Yes' Then 1 else 0 end)*100/count(*),2) as DefaultPercentage
from LoanData
group by CreditScoreGroup
order by Defaults Desc

--Default Rate by AgeGroup
select AgeGroup,
count(*) as TotalLoans,
sum(
	case
		when DefaultStatus='Yes' Then 1
		else 0
		end) as Defaults,
	round
		(sum(case when DefaultStatus='Yes' Then 1 Else 0 end)*100/count(*),2) as DefaultPercentage
from LoanData
group by AgeGroup
order by Defaults Desc

--Default by Employement Type
select EmploymentType,
count(*) as TotalLoans,
sum(
	case
		when DefaultStatus='Yes' Then 1 
		else 0
		end) as Defaults,
	round
		(sum(case when DefaultStatus='Yes' Then 1 else 0 end)*100/count(*),2) as DefaultPercentage
from LoanData
group by EmploymentType
order by Defaults Desc

--Default By Loan Size
select LoanSize,
count(*) as TotalLoans,
sum(
	case when DefaultStatus='Yes' Then 1 
	else 0
	end) as Defaults,
	round(
		sum(case when DefaultStatus='Yes' Then 1 else 0 end)*100/count(*),2) as DefaultPercentage
from LoanData
group by LoanSize
order by Defaults