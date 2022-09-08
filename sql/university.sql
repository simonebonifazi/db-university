-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT `date_of_birth` 
FROM `students`
WHERE `date_of_birth`
LIKE '1990-%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
  --SELECT `cfu` FROM `courses` where `cfu` > 10;

SELECT * 
FROM `courses` 
WHERE `cfu`> 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students` 
WHERE YEAR(`date_of_birth`) < 1992; --TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE() )

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * 
FROM `courses` 
WHERE `year`= 1 
AND `period`= 'I semestre';
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * 
FROM `exams` 
WHERE `date` = '2020-06-20' 
AND `hour`> '14:00:00'; --14
-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees` 
WHERE `name` 
LIKE '%magistrale%';
-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) 
FROM `departments`;
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) 
FROM `teachers` 
WHERE `phone`
IS NULL;

-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `n_studenti`, YEAR(`enrolment_date`) AS `anno_iscrizione`
FROM `students`
GROUP BY `anno_iscrizione` ;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `insegnanti_per_edificio`, `office_address` AS `coordinate_ufficio` 
FROM `teachers` 
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) 
FROM `exam_student` 
GROUP BY `exam_id` 
--ORDER BY AVG(`vote`) DESC;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS `corsi_di_laurea` 
FROM `degrees`  
GROUP BY `department_id`;