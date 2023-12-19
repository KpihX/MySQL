USE Parc;

CREATE TABLE Softs AS
SELECT nomLog AS nomSoft, version, prix
FROM Logiciel;

CREATE TABLE PCSeuls AS
SELECT nPoste AS nP, nomPoste AS nomP, indIP AS seg, ad, typePoste AS typeP, nSalle AS salle
FROM Poste
WHERE typePoste IN ('PCWS', 'PCNT');

SELECT * FROM Softs;
SELECT * FROM PCSeuls;
