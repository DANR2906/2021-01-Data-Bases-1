
CREATE TABLE usuario
(
    cedula integer PRIMARY KEY NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    telefono varchar(15),
    direccion varchar(40)
);



CREATE TABLE paciente
(
    idPaciente integer PRIMARY KEY NOT NULL,
    carnetEPS integer NOT NULL,
    historiaClinica varchar(500),
    enfermedades varchar(100),
    ordenMedica varchar(50) NOT NULL,
    CONSTRAINT fk_idPaciente FOREIGN KEY (idPaciente) REFERENCES usuario (cedula)
);


CREATE TABLE turno
(
    idTurno integer PRIMARY KEY NOT NULL
);

CREATE TABLE cita
(
    idCita integer PRIMARY KEY NOT NULL,
    fechaHora DATE NOT NULL,
    duracion integer NOT NULL,
    idTurno integer NOT NULL,
    idPaciente integer NOT NULL,
    CONSTRAINT fk_idTurno_cita FOREIGN KEY (idTurno) REFERENCES turno (idTurno),
    CONSTRAINT fk_idPaciente_cita FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente) 
);

CREATE TABLE medico
(
    idMedico integer PRIMARY KEY NOT NULL,
    tarjetaProfesional integer NOT NULL,
    
    CONSTRAINT fk_idMedico FOREIGN KEY (idMedico) REFERENCES usuario (cedula)
);

CREATE TABLE especialidad
(
  idEspecialidad integer PRIMARY KEY NOT NULL,
  nombre varchar(30) NOT NULL
);

CREATE TABLE detalleEspec
(
    idDetalleEspec integer PRIMARY KEY NOT NULL,
    idMedico integer NOT NULL,
    idEspecialidad integer,
    CONSTRAINT fk_idMedico_detalleEspec FOREIGN KEY (idMedico) REFERENCES medico (idMedico),
    CONSTRAINT fk_idEspecialidad_detalleEspec FOREIGN KEY (idEspecialidad) REFERENCES especialidad (idEspecialidad)
);



CREATE TABLE persAdmin
(
    idPersAdmin integer PRIMARY KEY NOT NULL,
    credenciales varchar(20),
    cargo varchar(30) NOT NULL,
    CONSTRAINT fk_idPersAdmin FOREIGN KEY (idPersAdmin) REFERENCES usuario (cedula)
);

CREATE TABLE enfermera
(
    idEnfermera integer PRIMARY KEY NOT NULL,
    credenciales varchar(20),
    cargo varchar(30) NOT NULL,
    CONSTRAINT fk_idEnfermera FOREIGN KEY (idEnfermera) REFERENCES usuario (cedula)
);

CREATE TABLE detalleTurno
(
    idDetalleTurno integer PRIMARY KEY NOT NULL,
    fechaHora DATE NOT NULL,
    duracion integer NOT NULL,
    idMedico integer NOT NULL,
    idTurno integer NOT NULL,
    CONSTRAINT fk_idMedico_detalleTurno FOREIGN KEY (idMedico) REFERENCES medico (idMedico),
    CONSTRAINT fk_idTurno_detalleTurno FOREIGN KEY (idTurno) REFERENCES turno (idTurno)
);

CREATE TABLE admonTurno
(
  idDetalleTurno1 integer NOT NULL,
  idDetalleTurno2 integer NOT NULL,
  CONSTRAINT fk_idDetalleTurno1_admon FOREIGN KEY (idDetalleTurno1) REFERENCES detalleTurno (idDetalleTurno),
  CONSTRAINT fk_idDetalleTurno2_admon FOREIGN KEY (idDetalleTurno2) REFERENCES detalleTurno (idDetalleTurno)
);

CREATE TABLE consulta
(
    idConsulta integer PRIMARY KEY NOT NULL,
    nacimiento DATE NOT NULL,
    ocupacion varchar(50),
    lugarProcedencia varchar(20) NOT NULL,
    estadoCivil varchar(15),
    especialidad varchar(30),
    pago integer,
    tipoConsulta varchar(15),
    idPaciente integer NOT NULL,
    idEspecialista integer NOT NULL,
    CONSTRAINT fk_idPaciente_consulta FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente),
    CONSTRAINT fk_idEspecialista_consulta FOREIGN KEY (idEspecialista) REFERENCES medico (idMedico)
);

CREATE TABLE posconsulta
(
    idPosconsulta integer PRIMARY KEY NOT NULL,
    fechaHora DATE NOT NULL,
    duracion integer NOT NULL,
    idEnfermera integer NOT NULL,
    idPaciente integer NOT NULL,
    idConsulta integer NOT NULL,
    CONSTRAINT fk_idEnfermera_posconsulta FOREIGN KEY (idEnfermera) REFERENCES enfermera (idEnfermera),
    CONSTRAINT fk_idPaciente_posconsulta FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente),
    CONSTRAINT fk_idConsulta_posconsulta FOREIGN KEY (idConsulta) REFERENCES consulta (idConsulta)
);