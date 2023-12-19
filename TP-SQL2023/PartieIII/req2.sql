-- Active: 1702171397384@@localhost@3306@TP_BD_3GI
USE TP_BD_3GI;

-- III-2/ Insertion des données dans EMP et DEPT
/*INSERT INTO EMP VALUES
    (7839, "KING", "PRESIDENT", NULL, "1981-11-17", 500, NULL, 10),
    (7698, "BLAKE", "MANAGER", 7839, "1981-05-01", 2850, NULL, 30),
    (7782, "CLARK", "MANAGER", 7839, "1981-06-09", 1500, NULL, 10),
    (7566, "JONES", "MANAGER", 7839, "1981-04-02", 2975, NULL, 20),
    (7654, "MARTIN", "SALESMAN", 7698, "1981-09-28", 1250, 1400, 30),
    (7499, "ALLEN", "SALESMAN", 7698, "1981-02-20", 1600, 300, 30),
    (7844, "TURNER", "SALESMAN", 7698, "1981-09-08", 1500, 0, 30),
    (7900, "JAMES", "CLERK", 7698, "1981-12-03", 950, NULL, 30),
    (7521, "WARD", "SALESMAN", 7698, "1981-02-22", 1250, 500, 30),
    (7902, "FORD", "ANALYST", 7566, "1981-12-03", 3000, NULL, 20),
    (7369, "SMITH", "CLERK", 7902, "1980-12-17", 800, NULL, 20),
    (7788, "SCOTT", "ANALYST", 7566, "1982-12-09", 3000, NULL, 20),
    (7876, "ADAMS", "CLERK", 7788, "1983-01-12", 1100, NULL, 20),
    (7934, "MILLER", "CLERK", 7782, "1982-01-23", 1300, NULL, 10);

INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
  (10, 'ACCOUNTING', 'NEW YORK'),
  (20, 'RESEARCH', 'DALLAS'),
  (30, 'SALES', 'CHICAGO'),
  (40, 'OPERATIONS', 'BOSTON');*/

-- III-3/ Affichage du nom, job, date d'embauche et du matricule de chaque employé
SELECT EMPNO, ENAME, JOB, HIREDATE 
FROM EMP;

-- III-4/ Affichage du nom concaténé avec le poste des employés
SELECT CONCAT(ENAME, ", ", JOB) AS 'Employee and Title'
FROM EMP;

-- III-5/ Affichage de toutes les informations des employés concatenées en une seule colonne
SELECT CONCAT_WS(", ", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) AS THE_OUTPUT
FROM EMP;

-- III-6/ Affichage du nom et du numéro de département de l'employé de matricule 7566
SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7566;

-- III-7/ Affichage du nom et du salaire des employés dont le salaire n'est pas entre 1500 et 2850
SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 1500 AND 2850;

-- III-8/ Affichage du nom, du poste et de la date d'entrée des employés embauchés entre le 20/02/1981 et 01/05/1981
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN "1981-02-20" AND "1981-05-01"
ORDER BY HIREDATE ASC;

-- III-9/ Affichage du numéro de département et des noms de tous les employés des départements, classés par ordre alphabétique des noms
SELECT DEPTNO, ENAME
FROM EMP
WHERE DEPTNO IN (10, 30)
ORDER BY ENAME ASC;

-- III-10/ Affichage des noms et salaires des employés gagnants plus de $1500 et travaillant dans les départements 10 ou 30
SELECT ENAME AS Employee, SAL AS 'Monthly Salary'
FROM EMP
WHERE SAL > 1500 AND DEPTNO IN (10, 30);

-- III-11/ Affichage du  nom et du poste des exmployés n'ayant pas de manager
SELECT ENAME, JOB 
FROM EMP
WHERE MGR IS NULL;

-- III-12/ Affichage  du nom, du salaire et de la commission de tous les employés qui perçoivent des commissions
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC, COMM DESC;

-- III-13/ Affichage du nom des employés dont la 3è lettre du nom est A
SELECT ENAME
FROM EMP
WHERE ENAME LIKE "__A%";
-- WHERE SUBSTRING(ENAME, 3, 2) = 'AK';

-- III-14/ Affichage du nom des employés dont le nom contient deux L, travaillant dans départements 30 ou dont le manager est 7782
SELECT ENAME
FROM EMP
WHERE ENAME LIKE "%L%L%" AND DEPTNO = 30 OR MGR = 7782;
-- WHERE REGEXP_COUNT(ENAME, 'L') = 2 AND DEPTNO = 30 OR MGR = 7782;

-- III-15/ Affichage du nom, du poste et du salaire de tous les CLERK ou ANALYST dont le salaire est différent de $1000, $3000 ou $5000
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN ("CLERK", "ANALYST") AND SAL NOT IN (1000, 3000, 5000);

-- III-16/ Affichage du nom, du salaire et de la commission de tous les employés dont le montant de commission est de plus de 10% supérieur au salaire.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM > 1.1 * SAL;

-- III-17/ Pour  chaque  employé,  affichez  le  matricule,  le  nom  en  minuscules  concaténé  à  son poste, la longueur du nom, le salaire et le salaire augmenté de 15% sous la forme d'un nombre entier. Nommez cette colonne New Salary.
SELECT 
    EMPNO, 
    CONCAT(LOWER(ENAME), JOB) AS "Name and Job", 
    LENGTH(ENAME), 
    SAL, 
    ROUND(SAL * 1.15) AS 'New Salary'
FROM EMP;

-- III-18/ Modifiez  votre  requête  en  ajoutant  une  colonne  dans  laquelle  l'ancien  salaire  est soustrait  du  nouveau  salaire.  Nommez  cette  colonne Increase
SELECT 
    EMPNO, 
    CONCAT(LOWER(ENAME), JOB) AS 'ENAME&JOB', 
    LENGTH(ENAME), 
    SAL, 
    ROUND(SAL * 1.15) AS 'New Salary',
    'New Salary' - SAL AS 'Increase'
FROM EMP;

-- III-19/ Afficher  les  données  concernant  les  employés  dont  le  nom  se  termine  par  un  N
SELECT *
FROM EMP
WHERE ENAME LIKE "%N";

-- III-20/ Affichez le nom et la date d'embauche de chaque employé ainsi que la date de révision du  salaire  qui  sera  le  premier  lundi  tombant  après  6  mois  d'activité.  Nommez  la colonne REVIEW. Les dates devront apparaître dans le format suivant : "Sunday, the Seventh of September, 1981."
SELECT
    ENAME,
    DATE_FORMAT(HIREDATE, '%W, the %D of %M, %Y') AS HIREDATE,
    DATE_FORMAT(DATE_ADD(REVIEW, INTERVAL IF(DAYOFWEEK(REVIEW) = 1, 1, 9 - DAYOFWEEK(REVIEW)) DAY), '%W, the %D of %M, %Y') AS REVIEW
FROM (
    SELECT
        ENAME,
        HIREDATE,
        DATE_ADD(HIREDATE, INTERVAL 6 MONTH) AS REVIEW
    FROM EMP
    ) AS REVIEWTABLE;

-- III-21/ Ecrivez  une  requête  affichant  les  informations  suivantes  pour  chaque  employé  : <employee  name>  earns  <salary>  monthly  but  wants  <3  times  salary>.  Nommez  la colonne Dream Salaries
SELECT
    CONCAT(ENAME, ' earns ', SAL, ' monthly but wants ', SAL * 3) 
    AS 'Dream Salaries'
FROM EMP;

-- III-22/ Affichez  le  nom,  la  date  d'embauche  ainsi  que  le  jour  de  la  semaine  où  l'employé  à débuté.  Nommez  la  colonne DAY.  Classez  les  résultats  dans  l'ordre  des  jours  de  la semaine à partir du lundi (Monday).
SELECT ENAME, HIREDATE, DAYNAME(HIREDATE) AS DAY
FROM EMP
ORDER BY WEEKDAY(HIREDATE) ASC;

-- III-23/ Créez  une  requête  pour  afficher  le  nom  et  le  montant  de  la  commission  de  chaque employé.   Pour   les   employés   ne   touchant   aucune   commission,   affichez   "No Commission". Nommez la colonne COMM
SELECT  
    ENAME,
    IF(COMM IS NULL, "No Commission", COMM) AS COMM
FROM EMP;

-- III-24/ Affichez  le  salaire  maximum,  le  salaire  minimum,  la  somme  des  salaires  et  le  salaire moyen  de  tous  les  employés.  Nommez  respectivement  les  colonnes Maximum, Minimum, Sum et Average.  Arrondissez les résultats à zéro décimale
SELECT 
    ROUND(MAX(SAL), 0) AS Maximum,
    ROUND(MIN(SAL), 0) AS Minimum,
    ROUND(SUM(SAL), 0) AS Sum,
    ROUND(AVG(SAL), 0) AS Average
FROM EMP;

-- III-25/ Ecrivez une requête pour afficher le nombre de personnes qui occupent le même poste.
SELECT 
    JOB,
    COUNT(*) AS 'Number of Employee'
FROM EMP
GROUP BY JOB;

-- III-26/ Déterminez  le  nombre  de  managers  sans  en  donner  la  liste.  Nommez  la  colonne Number of Managers.
SELECT COUNT(DISTINCT MGR) AS "Number of Managers"
FROM EMP;

-- III-27/ Ecrivez une requête pour afficher la différence existant entre le salaire maximum et le salaire   minimum.   Nommez   la   colonne DIFFERENCE.
SELECT
    MAX(SAL)-MIN(SAL) AS DIFFERENCE
FROM EMP;

-- III-28/ Affichez  le  matricule  des  différents  managers  et  le  niveau  de  salaire  le  plus  bas  de leurs  employés.  Excluez  toute  ligne  où  le  manager  n'est  pas  identifié.  Excluez  tout groupe  dans  lequel  le  salaire  minimum  est  inférieur  à  $1000.  Triez  les  résultats  par ordre décroissant des salaires.
SELECT 
    MGR,
    MIN(SAL) AS "Lowest Salary"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL) >= 1000
ORDER BY MIN(SAL) DESC;

-- III-29/ Ecrivez une requête pour afficher le numéro du département, le nombre d'employés et le  salaire  moyen  pour  tous  les  employés  de  ce  département.  Nommez  les  colonnes Number of dept, Number of People et Salary, respectivement
SELECT 
    DEPTNO,
    COUNT(*) AS "Number of People",
    AVG(SAL) AS "Salary"
FROM EMP
GROUP BY DEPTNO;

-- III-30/ Créez une requête pour afficher le nombre total d'employés puis, parmi ces employés, ceux  qui  ont  été  embauchés  en  1980,  1981,  1982  et  1983.  Nommez  les  colonnes  de façon appropriée.
SELECT 
  COUNT(*) AS "Total Employees",
  GROUP_CONCAT(CASE WHEN EXTRACT(YEAR FROM HIREDATE) = 1980 THEN ENAME END) AS "Employees Hired in 1980",
  GROUP_CONCAT(CASE WHEN EXTRACT(YEAR FROM HIREDATE) = 1981 THEN ENAME END) AS "Employees Hired in 1981",
  GROUP_CONCAT(CASE WHEN EXTRACT(YEAR FROM HIREDATE) = 1982 THEN ENAME END) AS "Employees Hired in 1982",
  GROUP_CONCAT(CASE WHEN EXTRACT(YEAR FROM HIREDATE) = 1983 THEN ENAME END) AS "Employees Hired in 1983"
FROM EMP;

-- III-31/ Créez  une  requête  pour  afficher  les  postes,  le  salaire  de  ces  postes  par  numéro  de département  et  le  salaire  total  de  ces  postes  incluant  tous  les  départements.  Nommez les colonnes de façon appropriée.
SELECT 
  JOB AS "Poste",
  DEPTNO AS "Numéro de Département",
  SUM(SAL) AS "Salaire par Département",
  SUM(SUM(SAL)) OVER (PARTITION BY JOB) AS "Salaire Total"
FROM EMP
GROUP BY JOB, DEPTNO;

-- III-32/ Ecrivez  une  requête  pour  afficher  le  nom,  le  numéro  de  département    de  tous  les employés.
SELECT ENAME, DEPTNO
FROM EMP;

-- III-33/ Créez  une  liste  unique  de  tous  les  postes  du  département  30
SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30;

-- III-34/ Ecrivez  une  requête  pour  afficher  le  nom,  le  poste,  le  numéro  de  département  et  le nom  du  département  de  tous  les  employés  basés  à  DALLAS.
SELECT ENAME, JOB, DEPTNO, DNAME
FROM EMP
NATURAL JOIN DEPT
WHERE LOC = "DALLAS";

-- III-35/ Affichez  le  nom  et  le  matricule  des  employés  et  de  leur  manager.  Nommez  les colonnes Employee, Emp#,Manager, et Mgr#, respectivement
SELECT 
    E.ENAME AS Employee,
    E.EMPNO AS "Emp#",
    M.ENAME AS Manager,
    M.EMPNO AS "Mgr#"
FROM EMP E 
JOIN EMP M ON E.MGR = M.EMPNO;
-- III-36/ Créez une requête pour afficher le nom, le poste, le département, le salaire et l'échelon de tous les employés
-- Nous allons d'abord créer la table SALGRADE dans s3.sql
-- On insère ensuite les enregistrements
-- Insertion des valeurs dans la table SALGRADE
/*INSERT INTO SALGRADE VALUES 
    (1, 700, 1200),
    (2, 1201, 1400),
    (3, 1401, 2000),
    (4, 2001, 3000),
    (5, 3001, 9999);*/
-- On effectue enfin la requête
SELECT ENAME, JOB, DNAME, SAL, GRADE AS "Échelon"
FROM EMP AS E
NATURAL JOIN DEPT
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- III-37/ Créez  une  requête  pour  afficher  le  nom  et  la  date  d'embauche  de  tous  les  employés arrivés après l'employé Blake.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > (
        SELECT HIREDATE
        FROM EMP 
        WHERE ENAME = 'Blake'
    );

-- III-38/ Créez  une  requête  pour afficher  le  nom  et  la  date  d'embauche  de  tous  les  employés travaillant dans le même département que Blake, à l'exclusion de Blake.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (
        SELECT DEPTNO 
        FROM EMP 
        WHERE ENAME = 'Blake'
    ) 
    AND ENAME != 'Blake';

-- III-39/ Créez  une  requête  pour  afficher  le  matricule  et  le  nom  de  tous  les  employés  qui gagnent    plus  que    le  salaire  moyen.  Triez  les  résultats  par  ordre  décroissant  des salaires
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC;

-- III-40/ Ecrivez  une  requête  pour  afficher  le  matricule  et  le  nom  de  tous  les  employés  qui travaillent  dans  le  même  département  que  tout  employé  dont  le  nom  contient  un  T.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM EMP
    WHERE ENAME LIKE "%T%"
    );

-- III-41/ Affichez le numéro de département, le nom et le poste de tous les employés travaillant dans le département des ventes ('SALES').
SELECT DEPTNO, ENAME, JOB
FROM EMP
NATURAL JOIN DEPT
WHERE DNAME = "SALES";