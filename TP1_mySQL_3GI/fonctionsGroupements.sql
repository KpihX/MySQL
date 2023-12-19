USE Parc;

-- Fonctions et groupements
-- 8. Pour chaque poste, le nombre de logiciels installés (en utilisant la table Installer)
SELECT nPoste, COUNT(nLog) AS nbLog
FROM Installer
GROUP BY nPoste;

-- 9. Pour chaque salle, le nombre de postes (à partir de la table Poste)
SELECT nSalle, COUNT(nPoste) AS nbPoste
FROM Poste
GROUP BY nSalle;

-- 10. Pour chaque logiciel, le nombre d’installations sur des postes différents
SELECT nLog, COUNT(DISTINCT nPoste) AS nbInstalPostesDiff
FROM Installer
GROUP BY nLog;

-- 11. Moyenne des prix des logiciels 'UNIX'
SELECT AVG(prix) AS moyPrixLogUNIX
FROM Logiciel
WHERE typeLog = 'UNIX';

-- 12. Plus récente date d’achat d’un logiciel
SELECT MAX(dateAch) AS dateAchatRecent
FROM Logiciel;

-- 13. Numéros des postes hébergeant 2 logiciels
SELECT nPoste
FROM Installer
GROUP BY nPoste
HAVING COUNT(nLog) = 2;

-- 14. Nombre de postes hébergeant 2 logiciels (utiliser la requête précédente en faisant un SELECT dans la clause FROM)
SELECT COUNT(*)
FROM (
  SELECT nPoste
  FROM Installer
  GROUP BY nPoste
  HAVING COUNT(nLog) = 2
) AS t;

