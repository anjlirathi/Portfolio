#SQL Practice on Hospital data

SELECT first_name, last_name, MAX(height)
FROM patients;

select * FROM patients
where patient_id IN (1,45,534,879,1000);

select COunt(patient_id) FROm admissions;

select* From admissions
where admission_date = discharge_date;

select patient_id, Count(patient_id)
FROM admissions 
where patient_id = 579;

select city From patients
WHere province_id = 'NS'
group by city;

select	 first_name, last_name, birth_date 
from patients
where height >160 AND weight>70;

select first_name, last_name, allergies
from patients
where allergies is not NULL AND city ='Hamilton';

select distinct(YEAR(birth_date)) AS birth_year	
from patients
order by birth_year ASC;

select first_name
From patients
Group By first_name
having COUNT(first_name)<2;

select patient_id, first_name
from patients
where first_name like 's____%s';

select patient_id, first_name
from patients
where first_name like 's%s' AND len(first_name)>=6;

select patients.patient_id ,first_name,last_name
From patients
Join admissions
On patients.patient_id = admissions.patient_id
where diagnosis = 'Dementia';

select first_name
from patients
order by Len(first_name), first_name ASC;


select 
	(Select count(*) from patients where gender ='M') As male_count,
    (select count(*) from patients where gender = 'F') As female_count;

select first_name, last_name, allergies
from patients
where allergies = 'Penicillin' Or allergies = 'Morphine'
order by allergies ASc, first_name, last_name;

select patient_id, diagnosis
from admissions
group by patient_id, diagnosis
Having count(*)>1;

select	city, count(patient_id)
from patients
group by city
order by count(patient_id) desc, city Asc;

select first_name, last_name, 'Patient' As role from patients
union all 
select first_name, last_name, 'Doctor' As role from doctors;

select day(admission_date) AS day_number , Count(admission_date) AS no_of_admissions
FROM admissions
Group BY day_number
order by no_of_admissions DESC;

select * from admissions
Where patient_id = 542
order BY admission_date Desc
LIMIT 1;

select 
	(select patient_id from admissions 
	where (patient_id/2) != 0 AND attending_doctor_id in (1,5,19)) AS patient_id,
    (select attending_doctor_id from admissions
     Where attending_doctor_id =2 and len(patient_id) =3) AS attending_doctor_id,
    diagnosis
FROM admissions;

select patient_id, attending_doctor_id, diagnosis
From admissions
Where 
  (patient_id % 2 != 0 and attending_doctor_id in (1,5,19))
  OR 
  (attending_doctor_id like '%2%' and len(patient_id) =3);

  select patient_id, attending_doctor_id, diagnosis
From admissions
Where 
  (patient_id % 2 != 0 and attending_doctor_id in (1,5,19))
  OR 
  (attending_doctor_id like '%2%' and len(patient_id) =3);
  
select first_name, last_name, Count(admission_date) As total_admissions
From admissions
join doctors
On admissions.attending_doctor_id = doctors.doctor_id
group by doctor_id;

select doctor_id, 
	concat(first_name, ' ', last_name) As full_name, 
	Min(admission_date) as first_admission_date,
    Max(admission_date) as last_admission_date
From doctors d
Join admissions a
On d.doctor_id = a.attending_doctor_id
Group By doctor_id;

select province_name, count(*) as total_patients
From patients p
Join province_names s
On p.province_id = s.province_id
group by province_name 
order by total_patients DESC;

select 
	concat(p.first_name, ' ', p.last_name) AS Patient_Name,
    diagnosis,
    concat(d.first_name, ' ', d.last_name) AS Doctor_Name
From patients p
Join admissions a
ON p.patient_id = a.patient_id
JOin doctors d 
ON a.attending_doctor_id = d.doctor_id;


select first_name, last_name, count(*) As duplicate_numbers
From patients
group by first_name, last_name
Having duplicate_numbers>1;

select 
	concat(first_name, ' ' , last_name) As full_name,
    Round(height/30.48, 1) As height,
    Round(weight* 2.205, 0) As weight,
    birth_date,
    CAse
    	When gender ='M' Then 'Male' 
        else 'Female' 
    END As gender
From patients;

select p.patient_id, first_name, last_name
From patients p 
Where p.patient_id Not IN ( select a.patient_id from admissions a);


/*Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
Check patients, admissions, and doctors tables for required information.*/

select p.patient_id, p.first_name, p.last_name,d.specialty
From patients p
JoiN admissions a
On p.patient_id = a.patient_id
Join doctors d 
On a.attending_doctor_id = d.doctor_id
Where diagnosis = 'Epilepsy' and d.first_name = 'Lisa';

/*All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date*/

select p.patient_id, 
	  concat (p.patient_id,Len(p.last_name),Year(birth_date)) As temp_password
From patients p 
Join admissions a 
On p.patient_id = a.patient_id
group by p.patient_id;

/*Another Solution*/
select Distict(p.patient_id), 
	  concat (p.patient_id,Len(p.last_name),Year(birth_date)) As temp_password
From patients p 
Join admissions a 
On p.patient_id = a.patient_id;

/*Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1.
Obese is defined as weight(kg)/(height(m)2) >= 30.
weight is in units kg.
height is in units cm.*/

select patient_id, weight, height,
	Case When weight/(POWER(height/100.0,2)) >=30 Then 1 Else 0
    End AS isobese
From patients;

/*Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.

Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group.*/

With insurance AS (
 select patient_id,
	   (Case	
       		when patient_id % 2 = 0 Then 'Yes'
            Else 'No'
            End) As has_insurance     
 From admissions
 )
select has_insurance, 
  Sum (Case	
       when  patient_id % 2 = 0 Then 10
            Else 50
            End
            ) As admission_total_cost
From insurance
Group by has_insurance;

/*Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name*/

select  pr.province_name 
From province_names pr
Join patients p
On pr.province_id = p.province_id
group by province_name
having
    Count(Case When gender = 'M' Then 1 EnD) > count(case when gender = 'F' then 1 End);

/*We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston'*/

select * from patients
where
	first_name like '__r%' AND
    gender = 'F' AND
    month(birth_date) IN (2,5,12) And 
    weight between 60 and 80 AND
    patient_id % 2 != 0 And
    city =  'Kingston';

/*Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.*/

select Concat (
	ROUND((
      	select Count(*)
      	From patients
      	where gender = 'M'
      )/ Cast(Count(*) AS Float),
      4)*100, '%') as male_patients_percent 
from patients;

/*For each day display the total amount of admissions on that day. Display the amount changed from the previous date.*/

With admission_count AS (
	select admission_date, Count(admission_date) As admission_day,
	Count(admission_date)-LAg(Count(admission_date)) OVER(order by admission_date) As admission_count_change
    From admissions
    Group by admission_date)
Select * from admission_count;

/*We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.*/


select doctor_id, 
	concat(d.first_name, ' ', d.last_name) As doctor_full_name, 
    specialty, 
    Year(admission_date) As year,  
    Count(admission_date) as total_admissions
from doctors d 
Join admissions a 
on d.doctor_id = a.attending_doctor_id
Group By doctor_full_name, Year;

/*Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.

For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.*/

Select count(patient_id) AS total_patients,
	   floor(weight/10)*10 As weight_group
From patients
Group by weight_group
Order By weight_group desc;

/*Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.

Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group.*/

select 
	Case When patient_id % 2 = 0 THen 'Yes' Else 'No' End  As has_insurance,
    Sum(Case When  patient_id % 2 = 0 then 10 Else 50 End ) As admission_total_cost
From admissions
group by has_insurance;
	   
/*Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name*/

select province_name
From province_names pn 
Join patients p 
On pn.province_id = p.province_id
Group By province_name
Having
	Sum(gender = 'M') > Sum(gender ='F');

/* Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.*/

select Concat(
    Round( (
    Select Count(*) From patients Where gender= 'M')
    / Cast(Count(*) As Float), 
   4)*100 , '%') As male_patients_percent
From patients;

/*Another method*/

SELECT
  round(100 * avg(gender = 'M'), 2) || '%' AS percent_of_male_patients
FROM
  patients;

/*And*/

  SELECT 
   CONCAT(ROUND(SUM(gender='M') / CAST(COUNT(*) AS float), 4) * 100, '%')
FROM patients;

/*Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.*/

select province_name 
from province_names
Order by 
	(Case when province_name = 'Ontario' Then 0 Else 1 End),
    province_name;

    