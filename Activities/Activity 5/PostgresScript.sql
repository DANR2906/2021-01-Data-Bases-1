CREATE SCHEMA taller5;

CREATE TABLE taller5.usuario
  (
     cedula    INTEGER PRIMARY KEY NOT NULL,
     nombres   VARCHAR(50) NULL,
     apellidos VARCHAR(50) NULL,
     telefono  INTEGER NULL,
     direccion VARCHAR(50) NULL
  );

CREATE TABLE taller5.paciente
  (
     idpaciente      INTEGER PRIMARY KEY NOT NULL,
     carneteps       VARCHAR(30) NOT NULL,
     historiaclinica VARCHAR(40) NOT NULL,
     enfermedades    VARCHAR(100),
     ordenmedica     VARCHAR(100) NOT NULL,
     CONSTRAINT fk_idpaciente FOREIGN KEY(idpaciente) REFERENCES taller5.usuario
     (cedula) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.turno
  (
     idturno INT PRIMARY KEY NOT NULL
  );

CREATE TABLE taller5.cita
  (
     idcita     INTEGER PRIMARY KEY NOT NULL,
     fecha      DATE NOT NULL,
     duracion   INTEGER NULL,
     idturno    INTEGER NULL,
     idpaciente INTEGER NULL,
     CONSTRAINT fk_idturno FOREIGN KEY(idturno) REFERENCES taller5.turno (
     idturno) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idpaciente FOREIGN KEY(idpaciente) REFERENCES
     taller5.paciente (idpaciente) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.medico
  (
     idmedico           INTEGER PRIMARY KEY NOT NULL,
     tarjetaprofesional VARCHAR(50) NOT NULL,
     CONSTRAINT fk_idmedico FOREIGN KEY(idmedico) REFERENCES taller5.usuario (
     cedula) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.detalleturno
  (
     iddetalleturno INTEGER PRIMARY KEY NOT NULL,
     fecha          DATE NOT NULL,
     duracion       INTEGER NOT NULL,
     idmedico       INTEGER NOT NULL,
     idturno        INTEGER NOT NULL,
     CONSTRAINT fk_idmedico FOREIGN KEY(idmedico) REFERENCES taller5.medico (
     idmedico) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idturno FOREIGN KEY(idturno) REFERENCES taller5.turno (
     idturno) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.especialidad
  (
     idespecialidad INTEGER PRIMARY KEY NOT NULL,
     nombre         INTEGER NOT NULL
  );

CREATE TABLE taller5.detalleesp
  (
     iddetalleesp   INTEGER PRIMARY KEY NOT NULL,
     idespecialidad INTEGER NOT NULL,
     idmedico       INTEGER NOT NULL,
     CONSTRAINT fk_idmedico FOREIGN KEY(idmedico) REFERENCES taller5.medico (
     idmedico) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idespecialidad FOREIGN KEY(idespecialidad) REFERENCES
     taller5.especialidad (idespecialidad) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.enfermera
  (
     idenfermera  INTEGER PRIMARY KEY NOT NULL,
     credenciales VARCHAR(30) NOT NULL,
     tipo         VARCHAR(20) NOT NULL,
     CONSTRAINT fk_idenfermera FOREIGN KEY(idenfermera) REFERENCES
     taller5.usuario (cedula) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.consulta
  (
     idconsulta       INTEGER PRIMARY KEY NOT NULL,
     nacimiento       DATE NOT NULL,
     ocupacion        VARCHAR(30) NOT NULL,
     lugarprocedencia VARCHAR(100) NOT NULL,
     estadocivil      VARCHAR(30) NOT NULL,
     especialidad     VARCHAR(30) NOT NULL,
     pago             INTEGER NOT NULL,
     tipoconsulta     VARCHAR(30) NOT NULL,
     idpaciente       INTEGER NOT NULL,
     idespecialista   INTEGER NOT NULL,
     CONSTRAINT fk_idpaciente FOREIGN KEY(idpaciente) REFERENCES
     taller5.paciente (idpaciente) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idespecialista FOREIGN KEY(idespecialista) REFERENCES
     taller5.medico (idmedico) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.posconsulta
  (
     idposconsulta INTEGER PRIMARY KEY NOT NULL,
     fecha         DATE NOT NULL,
     duracion      INTEGER NOT NULL,
     idenfermera   INTEGER NOT NULL,
     idpaciente    INTEGER NOT NULL,
     idconsulta    INTEGER NULL,
     CONSTRAINT fk_idpaciente FOREIGN KEY(idpaciente) REFERENCES
     taller5.paciente (idpaciente) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idenfermera FOREIGN KEY(idenfermera) REFERENCES
     taller5.enfermera (idenfermera) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT fk_idconsulta FOREIGN KEY(idconsulta) REFERENCES
     taller5.consulta (idconsulta) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.persadmin
  (
     idadmin      INTEGER PRIMARY KEY NOT NULL,
     credenciales VARCHAR(30) NOT NULL,
     cargo        VARCHAR(30) NOT NULL,
     CONSTRAINT fk_idadmin FOREIGN KEY(idadmin) REFERENCES taller5.usuario (
     cedula) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE taller5.admonturno
  (
     iddetalleturno1 INTEGER PRIMARY KEY NOT NULL,
     iddetalleturno2 INTEGER NOT NULL,
     CONSTRAINT fk_detalle_1 FOREIGN KEY(iddetalleturno1) REFERENCES
     taller5.detalleturno (iddetalleturno) ON DELETE RESTRICT ON UPDATE RESTRICT
     ,
     CONSTRAINT fk_detalle_2 FOREIGN KEY(iddetalleturno2) REFERENCES
     taller5.detalleturno (iddetalleturno) ON DELETE RESTRICT ON UPDATE RESTRICT
  ); 