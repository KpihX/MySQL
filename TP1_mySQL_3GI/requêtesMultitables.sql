-- Active: 1702171397384@@localhost@3306@Parc
USE Parc;

-- Requêtes multitables

-- Opérateurs ensemblistes

-- 15 Types de postes non recensés dans le parc informatique (utiliser la table Types)[
SELECT typeLP
FROM (
  SELECT typePoste AS typeLP
  FROM Poste
  UNION
  SELECT typeLog AS typeLP
  FROM Logiciel
) AS TypesLP
WHERE typeLP NOT IN (
  SELECT typeLP 
  FROM Types
);

-- 15 Types de postes non recensés dans le parc informatique (utiliser la table Types)
SELECT typeLP
FROM (
  SELECT typePoste AS typeLP
  FROM Poste
  UNION
  SELECT typeLog AS typeLP
  FROM Logiciel
) AS TypesLP
EXCEPT
SELECT typeLP
FROM Types;

-- 16. Types existant à la fois comme types de postes et de logiciels
SELECT typePoste AS typeLP
FROM Poste
INTERSECT
SELECT typelog AS typeLP
FROM Logiciel;

-- 17 Types de postes de travail n’étant pas des types de logiciels
SELECT typePoste AS typeLP
FROM Poste
EXCEPT
SELECT typelog AS typeLP
FROM Logiciel;

-- Jointures procédurales

-- 18 Adresses IP complètes des postes qui hébergent le logiciel 'log6'[^7^][7]
SELECT CONCAT(indIP, '.', ad) AS adresseIP
FROM Poste
WHERE nPoste IN (
  SELECT nPoste
  FROM Installer
  WHERE nLog = 'log6'
);

-- 19 Adresses IP complètes des postes qui hébergent le logiciel de nom 'Oracle 8'[^7^][7]
SELECT CONCAT(indIP, '.', ad) AS adresseIP
FROM Poste
WHERE nPoste IN (
  SELECT nPoste
  FROM Installer
  WHERE nLog IN (
    SELECT nLog
    FROM Logiciel
    WHERE nomLog = 'Oracle 8'
  )
);

-- 20 Noms des segments possédant exactement trois postes de travail de type 'TX'
SELECT nomSegment
FROM Segment
WHERE indIP IN (
  SELECT indIP 
  FROM Poste
  WHERE typePoste = 'TX'
  GROUP BY indIP
  HAVING COUNT(typePoste) = 3
);

-- 21 Noms des salles ou l’on peut trouver au moins un poste hébergeant le logiciel 'Oracle 6'[^8^][8]
SELECT nomSalle
FROM Salle
WHERE nSalle IN (
  SELECT nSalle
  FROM Poste
  WHERE nPoste IN (
    SELECT nPoste
    FROM Installer
    WHERE nLog IN (
      SELECT nLog 
      FROM Logiciel
      WHERE nomLog = 'Oracle 6'
    )
    -- GROUP BY nPoste
    -- HAVING COUNT(nLog) >= 1
  )
);


-- 22 Nom du logiciel acheté le plus récent (utiliser la requête 12)[^9^][9]
SELECT nomLog
FROM Logiciel
WHERE dateAch IN (
  SELECT MAX(dateAch) 
  FROM Logiciel
);

-- Jointures relationnelles
-- Écrire les requêtes 18, 19, 20, 21 avec des jointures de la forme relationnelle
-- Numéroter ces nouvelles requêtes de 23 à 26

-- 23 Adresses IP complètes des postes qui hébergent le logiciel 'log6'
SELECT CONCAT(indIP, '.', ad) AS adressIP
FROM Poste, Installer
WHERE Poste.nPoste = Installer.nPoste
AND Installer.nLog = 'log6';

-- 24 Adresses IP complètes des postes qui hébergent le logiciel de nom 'Oracle 8'
SELECT CONCAT(indIP, '.', ad) AS adressIP
FROM Poste, Installer, Logiciel
WHERE Poste.nPoste = Installer.nPoste
AND Installer.nLog = Logiciel.nLog
AND Logiciel.nomLog = 'Oracle 8';

-- 25 Noms des segments possédant exactement trois postes de travail de type 'TX'
SELECT nomSegment
FROM Poste, Segment
WHERE Poste.indIP = Segment.indIP
AND Poste.typePoste = 'TX'
GROUP BY nomSegment
HAVING COUNT(Poste.typePoste) = 3;

-- 26 Noms des salles ou l’on peut trouver au moins un poste hébergeant le logiciel 'Oracle 6'[^8^][8]
SELECT nomSalle
FROM Salle, Poste, Installer, Logiciel
WHERE Salle.nSalle = Poste.nSalle
AND Poste.nPoste = Installer.nPoste
AND Installer.nLog = Logiciel.nLog
AND Logiciel.nomLog = 'Oracle 6'
GROUP BY nomSalle;

-- 27 Installations (nom segment, nom salle, adresse IP complète, nom logiciel, date d’installation) triées par segment, salle et adresse IP
SELECT nomSegment, nomSalle, CONCAT(Poste.indIP, '.', ad) AS adressIP, nomLog, dateIns
FROM Segment, Salle, Poste, Installer, Logiciel
WHERE Segment.indIP = Salle.indIP
AND Salle.nSalle = Poste.nSalle
AND Poste.nPoste = Installer.nPoste
AND Installer.nLog = Logiciel.nLog
ORDER BY nomSegment, nomSalle, adressIP;

-- Jointures SQL2
-- Écrire les requêtes 18, 19, 20, 21 avec des jointures SQL2 (JOIN, NATURAL JOIN, JOIN USING)[^11^][11][^10^][10]
-- Numéroter ces nouvelles requêtes de 28 à 31

-- 28 Adresses IP complètes des postes qui hébergent le logiciel 'log6'
SELECT CONCAT(indIP, '.', ad) AS adressIP
FROM Poste 
NATURAL JOIN Installer
WHERE nLog = 'log6';

-- 29 Adresses IP complètes des postes qui hébergent le logiciel de nom 'Oracle 8'
SELECT CONCAT(indIP, '.', ad) AS adressIP
FROM Poste 
NATURAL JOIN Installer
NATURAL JOIN Logiciel
WHERE nomLog = 'Oracle 8';

-- 30 Noms des segments possédant exactement trois postes de travail de type 'TX'
SELECT nomSegment
FROM Segment
NATURAL JOIN Poste
WHERE typePoste = 'TX'
GROUP BY nomSegment
HAVING COUNT(typePoste) = 3;

-- 31 Noms des salles ou l’on peut trouver au moins un poste hébergeant le logiciel 'Oracle 6'
SELECT nomSalle
FROM Salle 
NATURAL JOIN Poste
NATURAL JOIN Installer 
NATURAL JOIN Logiciel
WHERE nomLog = 'Oracle 6'
GROUP BY nomSalle;
