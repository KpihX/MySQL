USE Parc;

-- Ajout de colonnes
ALTER TABLE Segment
ADD COLUMN nbSalle TINYINT(2) DEFAULT 0,
ADD COLUMN nbPoste TINYINT(2) DEFAULT 0;

ALTER TABLE Logiciel
ADD COLUMN nbInstall TINYINT(2) DEFAULT 0;

ALTER TABLE Poste
ADD COLUMN nbLog TINYINT(2) DEFAULT 0;

-- Affichage des modifications
DESCRIBE Segment;
SELECT * FROM Segment;

DESCRIBE Logiciel;
SELECT * FROM Logiciel;

DESCRIBE Poste;
SELECT * FROM Poste;

-- Modification de colonnes
ALTER TABLE Salle
MODIFY COLUMN nomSalle VARCHAR(30);

ALTER TABLE Segment 
MODIFY COLUMN nomSegment VARCHAR(15);

/*
ALTER TABLE Segment 
MODIFY COLUMN nomSegment VARCHAR(14);
- Cette commande ne marche pas car "Brin 1er  étage" à 15 caractères.
- Voici l'erreur en question : 'Error: WARN_DATA_TRUNCATED: Data truncated for column 'nomSegment' at row 2'

-- Vérification
DESCRIBE Salle;
SELECT * FROM Salle;
*/

DESCRIBE Segment;
SELECT * FROM Segment;

