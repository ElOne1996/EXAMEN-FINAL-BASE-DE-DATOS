create database ExamenFinal
use ExamenFinal
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 14:27:19.021

-- tables
-- Table: Apoderado
CREATE TABLE Apoderado (
    cod_apod int  identity(1,1) NOT NULL,
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
    cod_asis int identity(1,1) NOT NULL,
    nom_asis varchar(40)  NOT NULL,
    ape_asis varchar(40)  NOT NULL,
    dni_asis char(8)  NOT NULL,
    telf_asis char(9)  NOT NULL,
	Sexo varchar(1) not null,
    CONSTRAINT Asistente_pk PRIMARY KEY  (cod_asis)
);

-- Table: Chofer
CREATE TABLE Chofer (
    cod_chof int identity(1,1) NOT NULL,
    nom_chof varchar(40)  NOT NULL,
    ape_chof varchar(40)  NOT NULL,
    dni char(8)  NOT NULL,
    tefl char(9)  NOT NULL,
    CONSTRAINT Chofer_pk PRIMARY KEY  (cod_chof)
);

-- Table: DetalleModalidad
CREATE TABLE DetalleModalidad (
    cod_mod int identity(1,1) NOT NULL,
    tipo_mod varchar(40)  NOT NULL,
    turno varchar(40)  NOT NULL,
    recorrido varchar(40)  NOT NULL,
    Chofer_cod_chof int  NOT NULL,
    Asistente_cod_asis int  NOT NULL,
    CONSTRAINT DetalleModalidad_pk PRIMARY KEY  (cod_mod)
);

-- Table: Infante
CREATE TABLE Infante (
    cod_infante int identity(1,1) NOT NULL,
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





insert into Asistente(ape_asis,dni_asis,telf_asis)
values('mark','huaman',15451042,914544777),
('juan','pe',1540147,914544777),
('alex','guti',1554555,914544777),
('jose','jes',15478958,914544777);



/*SP DE APODERADO*/
CREATE PROCEDURE sp_lsApoderado
AS
    BEGIN
        SELECT * FROM Apoderado
    END
GO

exec sp_lsApoderado



/*SP DE ASISTENTE ordenar por nombre*/
CREATE PROCEDURE sp_lsAsisten
AS
    BEGIN
        SELECT * FROM Asistente
        ORDER BY  Asistente.nom_asis ASC
    END
GO

EXEC sp_lsAsisten
GO
/*listar un asistente por sexo*/
ALTER PROCEDURE sp_lsAsisten
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT *
        FROM Asistente
        WHERE Asistente.nom_asis = @Sexo
    END
GO
/*tipo de genero del asistente*/
ALTER PROCEDURE sp_lsAsisten
    @Sexo VARCHAR(1)
AS
    BEGIN
        SELECT CONCAT( Asistente.ape_asis, ', ', Asistente.nom_asis) AS Asistente,
        Asistente.dni_asis AS dni,
        Sexo =
        CASE 
            WHEN Asistente.sexo = 'F' THEN 'Femenino'
            WHEN Asistente.sexo = 'M' THEN 'masculino'
        END
        FROM Asistente
        WHERE Asistente.sexo = @Sexo
    END
GO
/*registrar un chofer*/
CREATE PROCEDURE sp_AddAsistente
    @Codigo VARCHAR(4),
    @nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Asistente
            (cod_asis, nom_asis)
        VALUES
            (@Codigo, @nombre)
    END
GO

/*ingresar un asistente sin repetir*/

ALTER PROCEDURE sp_AddAsistente
    @Codigo INT,
    @nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Asistente.cod_asis FROM Asistente WHERE Asistente.cod_asis = @Codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro porque el código ya existe' AS 'Resultado'
        ELSE
            INSERT INTO Asistente
                (cod_asis, nom_asis)
            VALUES
                (@Codigo, @nombre);
            SELECT * FROM Asistente ORDER BY cod_asis
    END
GO


/*SP DE chofer*/

/*ordenar un chofer por nombre*/
CREATE PROCEDURE sp_lsChofer
AS
    BEGIN
        SELECT * FROM Chofer
        ORDER BY  Chofer.nom_chof ASC
    END
GO

EXEC sp_lsChofer
GO
/***/
ALTER PROCEDURE sp_lsChofer
    @Turno VARCHAR(1)
AS
    BEGIN
        SELECT *
        FROM Chofer
        WHERE Chofer.nom_chof = @Turno
    END
GO
/*estado del chofer en que turno trabaja**/
ALTER PROCEDURE sp_lsChofer
    @Turno VARCHAR(1)
AS
    BEGIN
        SELECT CONCAT( Chofer.ape_chof, ', ', Chofer.nom_chof) AS Chofer,
        Chofer.dni AS DNI,
        Turno =
        CASE 
            WHEN Chofer.Turno = 'M' THEN 'MAÑANA'
            WHEN Chofer.Turno = 'T' THEN 'TARDE'
        END
        FROM Chofer
        WHERE Chofer.Turno = @Turno
    END
GO
/* agregar un chofer*/
CREATE PROCEDURE sp_AddChofer
    @Codigo VARCHAR(4),
    @nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Chofer
            (cod_chof, nom_chof)
        VALUES
            (@Codigo, @nombre)
    END
GO
/**/
/*ingresar un registro sin repetir*/
ALTER PROCEDURE sp_AddChofer
    @Codigo INT,
    @nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Chofer.cod_chof FROM Chofer WHERE Chofer.cod_chof = @Codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro porque el código ya existe' AS 'Resultado'
        ELSE
            INSERT INTO Chofer
                (cod_chof, nom_chof)
            VALUES
                (@Codigo, @nombre);
            SELECT * FROM Chofer ORDER BY cod_chof
    END
GO

/*sp de INFANTES*/

 /*eliminar un registro atraves de sp*/
CREATE PROCEDURE SP_DelIfante
    @Codigo VARCHAR(4)
AS
    BEGIN
        DELETE FROM Infante
        WHERE Infante.cod_infante = @Codigo
    END
GO

/**/