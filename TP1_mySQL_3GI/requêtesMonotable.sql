-- Active: 1702171397384@@localhost@3306@Parc
USE Parc;

SELECT typePoste 
FROM Poste 
WHERE nPoste = 'p8';

SELECT nomLog 
FROM Logiciel 
WHERE typeLog = 'UNIX';

SELECT nPoste, indIP, nSalle 
FROM Poste 
WHERE typePoste IN ('UNIX', 'PCWS');

SELECT nPoste, indIP, nSalle 
FROM Poste 
WHERE indIP = '130.120.80' 
ORDER BY nSalle DESC;

SELECT nLog 
FROM Installer 
WHERE nPoste = 'p6';

SELECT nPoste 
FROM Installer 
WHERE nLog = 'log1';

SELECT CONCAT(indIP, '.', ad) AS adresseIP, nPoste 
FROM Poste 
WHERE typePoste = 'TX';
