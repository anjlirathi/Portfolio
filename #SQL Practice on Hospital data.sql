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


