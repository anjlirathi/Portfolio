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

