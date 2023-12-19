USE Parc;

ALTER TABLE Installer 
ADD CONSTRAINT uc_Installer UNIQUE (nPoste, nLog);

ALTER TABLE Poste 
ADD CONSTRAINT fk_Poste_typePoste_Types FOREIGN KEY (typePoste) REFERENCES Types(typeLP);

ALTER TABLE Poste 
ADD CONSTRAINT fk_Poste_indIP_Segment FOREIGN KEY (indIP) REFERENCES Segment(indIP);

ALTER TABLE Poste 
ADD CONSTRAINT fk_Poste_nSalle_Salle FOREIGN KEY (nSalle) REFERENCES Salle(nSalle);

ALTER TABLE Installer 
ADD CONSTRAINT fk_Installer_nPoste_Poste FOREIGN KEY (nPoste) REFERENCES Poste(nPoste);

ALTER TABLE Installer 
ADD CONSTRAINT fk_Installer_nLog_Logiciel FOREIGN KEY (nLog) REFERENCES Logiciel(nLog);

