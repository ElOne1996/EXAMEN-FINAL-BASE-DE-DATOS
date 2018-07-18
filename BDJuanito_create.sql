-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 14:27:19.021

-- tables
-- Table: Apoderado
CREATE TABLE Apoderado (
    cod_apod int  NOT NULL,
    nom_apod varchar(40)  NOT NULL,
    ape_apod varchar(40)  NOT NULL,
    DNi char(8)  NOT NULL,
    telf char(9)  NOT NULL,
    Direccion varchar(50)  NOT NULL,
    parent varchar(40)  NOT NULL,
    CONSTRAINT Apoderado_pk PRIMARY KEY  (cod_apod)
);

-- Table: Asistente
CREATE TABLE Asistente (
    cod_asis int  NOT NULL,
    nom_asis varchar(40)  NOT NULL,
    ape_asis varchar(40)  NOT NULL,
    dni_asis char(8)  NOT NULL,
    telf_asis char(9)  NOT NULL,
    CONSTRAINT Asistente_pk PRIMARY KEY  (cod_asis)
);

-- Table: Chofer
CREATE TABLE Chofer (
    cod_chof int  NOT NULL,
    nom_chof varchar(40)  NOT NULL,
    ape_chof varchar(40)  NOT NULL,
    dni char(8)  NOT NULL,
    tefl char(9)  NOT NULL,
    CONSTRAINT Chofer_pk PRIMARY KEY  (cod_chof)
);

-- Table: DetalleModalidad
CREATE TABLE DetalleModalidad (
    cod_mod int  NOT NULL,
    tipo_mod varchar(40)  NOT NULL,
    turno varchar(40)  NOT NULL,
    recorrido varchar(40)  NOT NULL,
    Chofer_cod_chof int  NOT NULL,
    Asistente_cod_asis int  NOT NULL,
    CONSTRAINT DetalleModalidad_pk PRIMARY KEY  (cod_mod)
);

-- Table: Infante
CREATE TABLE Infante (
    cod_infante int  NOT NULL,
    nom_infan varchar(40)  NOT NULL,
    ape_infan varchar(40)  NOT NULL,
    Apoderado_cod_apod int  NOT NULL,
    Chofer_cod_chof int  NOT NULL,
    Asistente_cod_asis int  NOT NULL,
    CONSTRAINT Infante_pk PRIMARY KEY  (cod_infante)
);

-- foreign keys
-- Reference: DetalleModalidad_Asistente (table: DetalleModalidad)
ALTER TABLE DetalleModalidad ADD CONSTRAINT DetalleModalidad_Asistente
    FOREIGN KEY (Asistente_cod_asis)
    REFERENCES Asistente (cod_asis);

-- Reference: DetalleModalidad_Chofer (table: DetalleModalidad)
ALTER TABLE DetalleModalidad ADD CONSTRAINT DetalleModalidad_Chofer
    FOREIGN KEY (Chofer_cod_chof)
    REFERENCES Chofer (cod_chof);

-- Reference: Infante_Apoderado (table: Infante)
ALTER TABLE Infante ADD CONSTRAINT Infante_Apoderado
    FOREIGN KEY (Apoderado_cod_apod)
    REFERENCES Apoderado (cod_apod);

-- Reference: Infante_Asistente (table: Infante)
ALTER TABLE Infante ADD CONSTRAINT Infante_Asistente
    FOREIGN KEY (Asistente_cod_asis)
    REFERENCES Asistente (cod_asis);

-- Reference: Infante_Chofer (table: Infante)
ALTER TABLE Infante ADD CONSTRAINT Infante_Chofer
    FOREIGN KEY (Chofer_cod_chof)
    REFERENCES Chofer (cod_chof);

-- End of file.

