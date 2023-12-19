USE TP_BD_3GI;

-- II-2/ Insertion dans MY_EMPLOYEE sans énumérer les colonnes
/*INSERT INTO MY_EMPLOYEE VALUES
    (1, "Patel", "Ralph", "Rpatel", 795);

-- II-3/ Insertion dans MY_EMPLOYEE en énumérant les colonnes
INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY) VALUES
    (2, "Dancs", "Betty", "Bdancs", 860),
    (3, "Biri", "Ben", "Bbiri", 1100),
    (4, "Newman", "Chad", "Cnewman", 750);

-- II-4/ Remplacement du nom de l'emploté 3 par Drexler
UPDATE MY_EMPLOYEE
SET LAST_NAME = "Drexler"
WHERE ID = 3;

-- II-5/ Saisie d'un salaire de 1000 pour tous les employés qui ont moins de 900 de salaire
UPDATE MY_EMPLOYEE
SET SALARY = 1000
WHERE SALARY < 900;

-- II-6/ Suppression de Betty Dancs dans MY_EMPLOYEE
DELETE FROM MY_EMPLOYEE
WHERE FIRST_NAME = "Betty" AND LAST_NAME = "Dancs";*/

-- II-7/ Vidange de la table MY_EMPLOYEE
DELETE FROM MY_EMPLOYEE;