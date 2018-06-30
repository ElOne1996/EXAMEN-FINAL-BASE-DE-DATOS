create DATABASE GUARDERIA;
USE GUARDERIA
CREATE TABLE Menu
(
    cod_men int NOT NULL,
    num_men char(5) NOT NULL,
    plato varchar(50) NOT NULL,
    detalleMenu_cod_detalle_menu int NOT NULL,
    CONSTRAINT Menu_pk PRIMARY KEY (cod_men)
);

-- Table: apoderado
CREATE TABLE apoderado
(
    cod_apo int NOT NULL,
    nom_apod varchar(50) NOT NULL,
    ape_apod varchar(50) NOT NULL,
    DNI_apod char(8) NOT NULL,
    telef_apod char(9) NOT NULL,
    dir varchar(50) NOT NULL,
    CONSTRAINT apoderado_pk PRIMARY KEY (cod_apo)
);

-- Table: detalleMenu
CREATE TABLE detalleMenu
(
    cod_detalle_menu int NOT NULL,
    estado_consu char(1) NOT NULL,
    infante_cod_infante int NOT NULL,
    CONSTRAINT detalleMenu_pk PRIMARY KEY (cod_detalle_menu)
);

-- Table: detalle_apod
CREATE TABLE detalle_apod
(
    cod_detalle int NOT NULL,
    carg_men decimal(4,2) NOT NULL,
    total decimal(4,2) NOT NULL,
    gastos_cod_gasto int NOT NULL,
    CONSTRAINT detalle_apod_pk PRIMARY KEY (cod_detalle)
);

-- Table: detalle_infante
CREATE TABLE detalle_infante
(
    cod_detalle_infant int NOT NULL,
    aler_infante_ingre varchar(50) NOT NULL,
    infante_cod_infante int NOT NULL,
    CONSTRAINT detalle_infante_pk PRIMARY KEY (cod_detalle_infant)
);

-- Table: detalle_movilidad
CREATE TABLE detalle_movilidad
(
    cod_deta int NOT NULL,
    const_ varchar(50) NOT NULL,
    tipo_relac varchar(50) NOT NULL,
    movilidad_cod_encar int NOT NULL,
    CONSTRAINT detalle_movilidad_pk PRIMARY KEY (cod_deta)
);

-- Table: gastos
CREATE TABLE gastos
(
    cod_gasto int NOT NULL,
    cost_fijo_men decimal(4,2) NOT NULL,
    coste_alim decimal(4,2) NOT NULL,
    cost_consum decimal(4,2) NOT NULL,
    apoderado_cod_apo int NOT NULL,
    CONSTRAINT gastos_pk PRIMARY KEY (cod_gasto)
);

-- Table: infante
CREATE TABLE infante
(
    cod_infante int NOT NULL,
    nom_infa varchar(50) NOT NULL,
    ape__infa varchar(50) NOT NULL,
    fech_naci time NOT NULL,
    movilidad_cod_encar int NOT NULL,
    apoderado_cod_apo int NOT NULL,
    CONSTRAINT infante_pk PRIMARY KEY (cod_infante)
);

-- Table: ingredientes
CREATE TABLE ingredientes
(
    cod_ingred int NOT NULL,
    nombre_ingre varchar(50) NOT NULL,
    Menu_cod_men int NOT NULL,
    detalle_infante_cod_detalle_infant int NOT NULL,
    CONSTRAINT ingredientes_pk PRIMARY KEY (cod_ingred)
);

-- Table: movilidad
CREATE TABLE movilidad
(
    cod_encar int NOT NULL,
    nom_encar varchar(50) NOT NULL,
    ape_encar varchar(50) NOT NULL,
    dir_encarg varchar(50) NOT NULL,
    telf_encar char(9) NOT NULL,
    CONSTRAINT movilidad_pk PRIMARY KEY (cod_encar)
);

-- foreign keys
-- Reference: Menu_detalleMenu (table: Menu)
ALTER TABLE Menu ADD CONSTRAINT Menu_detalleMenu
    FOREIGN KEY (detalleMenu_cod_detalle_menu)
    REFERENCES detalleMenu (cod_detalle_menu)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: detalleMenu_infante (table: detalleMenu)
ALTER TABLE detalleMenu ADD CONSTRAINT detalleMenu_infante
    FOREIGN KEY (infante_cod_infante)
    REFERENCES infante (cod_infante)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: detalle_apod_gastos (table: detalle_apod)
ALTER TABLE detalle_apod ADD CONSTRAINT detalle_apod_gastos
    FOREIGN KEY (gastos_cod_gasto)
    REFERENCES gastos (cod_gasto)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: detalle_infante_infante (table: detalle_infante)
ALTER TABLE detalle_infante ADD CONSTRAINT detalle_infante_infante
    FOREIGN KEY (infante_cod_infante)
    REFERENCES infante (cod_infante)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: detalle_movilidad_movilidad (table: detalle_movilidad)
ALTER TABLE detalle_movilidad ADD CONSTRAINT detalle_movilidad_movilidad
    FOREIGN KEY (movilidad_cod_encar)
    REFERENCES movilidad (cod_encar)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: gastos_apoderado (table: gastos)
ALTER TABLE gastos ADD CONSTRAINT gastos_apoderado
    FOREIGN KEY (apoderado_cod_apo)
    REFERENCES apoderado (cod_apo)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: infante_apoderado (table: infante)
ALTER TABLE infante ADD CONSTRAINT infante_apoderado
    FOREIGN KEY (apoderado_cod_apo)
    REFERENCES apoderado (cod_apo)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: infante_movilidad (table: infante)
ALTER TABLE infante ADD CONSTRAINT infante_movilidad
    FOREIGN KEY (movilidad_cod_encar)
    REFERENCES movilidad (cod_encar)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ingredientes_Menu (table: ingredientes)
ALTER TABLE ingredientes ADD CONSTRAINT ingredientes_Menu
    FOREIGN KEY (Menu_cod_men)
    REFERENCES Menu (cod_men)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ingredientes_detalle_infante (table: ingredientes)
ALTER TABLE ingredientes ADD CONSTRAINT ingredientes_detalle_infante
    FOREIGN KEY (detalle_infante_cod_detalle_infant)
    REFERENCES detalle_infante (cod_detalle_infant)
NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

select *
from apoderado
INSERT INTO apoderado
    (cod_apo,nom_apod,ape_apod,DNI_apod,telef_apod,dir )
VALUES
    (1, 'mark antony', 'huaman huari', 15451042, 990915420, 'av. mariscal benavides'),
(2,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
(3,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
 (4,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
 (5,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
 (6,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'), 
 (7,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
 (8,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides'),
 (9,'mark antony','huaman huari',15451042,990915420,'av. mariscal benavides');

 CREATE VIEW nombre_ingre
AS
   SELECT apoderado.dir AS 'apoderado' , COUNT(apoderado.nombre_ingre) AS 'apoderado'
    FROM Libro
        INNER JOIN apoderado
        ON ape_apod.nombre_ingre = ape_apod.nombre_ingre
   GROUP BY ape_apod.nombre_ingre
GO
/* Ver registros de vista */
SELECT *
FROM apoderado
GO

SELECT*from infante
CREATE VIEW  apoderado
AS
SELECT infante.nom_infa AS 'infante', COUNT(apoderado.cod_apo) AS 'infante'
FROM infante
INNER JOIN infante
ON infante.nom_infa=nom_infa.ape_encar
GROUP BY nom_infa.ape_apod
GO