USE Parc;

/*
ALTER TABLE Salle
ADD CONSTRAINT fk_Salle_indIP_Segment
FOREIGN KEY (indIP)
REFERENCES Segment(indIP);

ALTER TABLE Logiciel
ADD CONSTRAINT fk_Logiciel_typeLog_Types
FOREIGN KEY (typeLog)
REFERENCES Types(typeLP);

-- Ces requêtes lèvent les erreurs au niveau des tuples de Salle d'adresse IP '130.120.83' et au niveau de 'BeOS' dans logiciel
*/

-- On récupère les tuples qui posent problème avec une jointure à gauche

SELECT nSalle, Salle.indIP
FROM Salle
LEFT JOIN Segment ON Salle.indIP = Segment.indIP
WHERE Segment.indIP IS NULL;

SELECT nLog, Logiciel.typeLog
FROM Logiciel
LEFT JOIN Types ON Logiciel.typeLog = Types.typeLP
WHERE Types.typeLP IS NULL;

-- On supprime les enregistrements de Salle qui posent problème

DELETE FROM Salle
WHERE indIP = '130.120.83';

-- On insère le types 'BeOS' manquant 

INSERT INTO Types (typeLP, nomType) VALUES
    ('BeOS', 'Système BeOS');

-- On reprend avec l'ajout des contraintes

ALTER TABLE Salle 
ADD CONSTRAINT fk_Salle_indIP_Segment 
FOREIGN KEY (indIP) 
REFERENCES Segment(indIP);

ALTER TABLE Logiciel 
ADD CONSTRAINT fk_Logiciel_typeLog_Types 
FOREIGN KEY (typeLog) 
REFERENCES Types(typeLP);
