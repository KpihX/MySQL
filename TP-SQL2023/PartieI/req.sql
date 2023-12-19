USE TP_BD_3GI;

/*-- I-2/ Remplissage de la table DEPARTEMENT
INSERT INTO DEPARTEMENT (ID, NAME) VALUES 
    (10, "ACCOUNTING"),
    (20, "RESEARCH"),
    (30, "SALES"),
    (40, "OPERATIONS");

-- I-4/ Modification de EMPLOYEE pour allonger les noms de familles des employés
ALTER TABLE EMPLOYEE
MODIFY COLUMN LAST_NAME VARCHAR(50);

-- I-6/ Renommage des colonnes de EMPLOYEE
ALTER TABLE EMPLOYEE2
RENAME COLUMN EMPNO TO ID,
RENAME COLUMN ENAME TO LAST_NAME,
RENAME COLUMN DEPTNO TO DEPT_ID;

-- I-8/ Renommage de EMPLOYEE2 à EMPLOYEE
ALTER TABLE EMPLOYEE2 RENAME TO EMPLOYEE;

-- I-9/ Ajout de la contrainte PRIMARY KEY dans EMPLOYEE en utilisant la colonne ID
ALTER TABLE EMPLOYEE
ADD CONSTRAINT pk_employee 
PRIMARY KEY (ID);

-- I-10/ Ajout de la contrainte PRIMARY KEY dans DEPARTEMENT en utilisant la colonne ID
ALTER TABLE DEPARTEMENT
ADD CONSTRAINT pk_departement
PRIMARY KEY (ID);

-- I-11/ AJout de la clé étrangère dans EMPLOYEE en rapport avec le departement de l'employé
ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_employee_dept_id_departement 
FOREIGN KEY (DEPT_ID) 
REFERENCES DEPARTEMENT(ID);*/