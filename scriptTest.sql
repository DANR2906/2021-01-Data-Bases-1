drop database if exists redflix2;

create database redflix2;

-- -----------------------------------------------------
-- Schema reto5
-- -----------------------------------------------------
use redflix2;

CREATE TABLE peliculas (
  id_Peliculas int primary key auto_increment,
  titulo varchar(45),
  resumen varchar(255),
  ano integer(2),
  idDirector int
);

drop table peliculas;
-- Peliculas -- 
INSERT INTO peliculas (titulo, resumen, ano, idDirector) VALUES ("Los Vengadores", "Pelicula de superheroes basada en Marvel Comics. Nick Fury director de SHIELD recluta a Tony Stark, Steve Rogers, Bruce Banner y Thor para forma un equipo y evitar que Loki, hermano de Thor, se apodere de la tierra.",1990,102);
INSERT INTO peliculas (titulo, resumen, ano, idDirector) VALUES ("Interestelar", "Pelicula de ciencia ficción, donde la humanidad lucha por sobrevivir. La pelicula cuenta una historia de un grupo de astronautas que viajan a traves de un agujero de gusano en busca de un nuevo hogar.",2014,103);
INSERT INTO peliculas (titulo, resumen, ano, idDirector) VALUES ("El viaje de Chihiro", "Pelicula de animación japonesa. Es la historia de una niña de 12 años, quien se ve atrapada por un mundo mágico y sobrenatural, teniendo como misión buscar su libertad y la de sus padres y regresar al mundo real.",2001,101);
INSERT INTO peliculas (titulo, resumen, ano, idDirector) VALUES ("Parasitos", "Pelicula de drama, suspenso y humor negro. Toca temas como las diferencias sociales y vulnerabilidad del espiritu humano",2019,104);
INSERT INTO peliculas (titulo, resumen, ano, idDirector) VALUES ("Mas alla de los sueños", "Pelicula de drama, narra una historia trágica de una familia, donde el padre va en busca de sus esposa al mas allá para recuperarla.",1998,105);

drop table series;
CREATE TABLE series (
  idseries int primary key auto_increment,
  titulo varchar(45),
  numeroTemporadas int,
  numeroEpisodios int
);
-- series -- 
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("The walking dead",153,11);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("Viaje a las estrellas: la series original", 80, 3);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("Glow", 30, 3);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("La casa de papel", 31, 4);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("Friends", 236, 10);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("The big bang theory", 279, 12);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("Vikingos", 79, 6);
INSERT INTO series (titulo, numeroEpisodios, numeroTemporadas) VALUES ("Arrow", 170, 8);

drop table usuarios;
CREATE TABLE usuarios (
  nombres varchar(30),
  apellidos varchar(30),
  email varchar(30),
  celular varchar(10),
  alias varchar(20) primary key,
  contrasena varchar(45),
  fecha_nacimiento date
);
-- usuarioss -- 
INSERT INTO usuarios VALUES ("Pedro", "Perez", "PedroPerez1@hotmail.com",3135691977 ,"lucky", "aHas33@e1221lñ" ,"2000-03-01" );
INSERT INTO usuarios VALUES ("Maria", "Lopez", "MarLopez32@gmail.com",3125611977 ,"malopez", "aHas32@e1221lñ" ,"1995-12-12" );
INSERT INTO usuarios VALUES ("Ana", "Diaz", "Andi90@gmail.com",3176691957 ,"diva", "aHas@e1221asalñ" ,"1990-06-02" );
INSERT INTO usuarios VALUES ("Luis", "Rojas", "LuisR1985@outlook.com",3125691977 ,"dreamer", "aHas@e1221lñhola" ,"1985-07-21" );
INSERT INTO usuarios VALUES ("Andres", "Cruz", "NinjaCruz@gmail.com",3215339971 ,"ninja", "aHas@e12asfas21lñ" ,"1995-08-11" );
INSERT INTO usuarios VALUES ("Nelson", "Ruiz", "NelsonRuiz16@ymail.com",3175691972 ,"neon", "aHaneons@e1221lñd0" ,"2001-09-13" );
INSERT INTO usuarios VALUES ("Claudia", "Mendez", "CMend18@unal.edu.co",3003691973 ,"rose", "aHasbb@e1221dadlñ" ,"1999-10-06" );
INSERT INTO redflix2.usuarios VALUES ("Jorge", "Rodriguez", "gmailJorgeR00@gmail.com",3205694974 ,"green", "aHas@e122yes1lñ" ,"2000-11-01" );
