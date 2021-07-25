CREATE DATABASE Tutorias
create table Estudiante(
	IdEstudiante int identity(1,1) not null ,
	CodEstudiante as ('AL'+right('00'+convert(varchar,IdEstudiante),(2))),
	Nombres varchar(20),
	Apellidos varchar(20),
	Escuela varchar (20),
	PRIMARY KEY (IdEstudiante)
);

create table Docente(
	IdDocente int identity(1,1),
	Nombres varchar(30),
	Apellidos varchar(30),
	TituloAcademico varchar (70),
	Facultad varchar(90),
	EscuelaProfesional varchar(70),
	Categoria varchar (60),
	PRIMARY KEY (IdDocente)
);
create table Logins(
	Usuario varchar(40) not null,
	Contraseña varchar(40) not null,
	CategoriaLogin varchar (40)
);
insert into Logins values ('Yo','123','Nombrado')
insert into Logins values ('Cata','cata','Contratado')


insert into Estudiante
values ('lucero','quispe','informatica')
insert into Estudiante
values ('Maria','Fernandez','informatica')
drop table Estudiante
--select * from Estudiante
--------------------------------------------
---PROCEDIMIENTO ALMACENADO BUSCARESTUDIANTE
CREATE PROC SP_BUSCARESTUDIANTE
@BUSCAR varchar(20)
as
select * from Estudiante
where Nombres like @BUSCAR + '%'
---PROCEDIMIENTO ALMACENADO INSERTAR ESTUDIANTE
create proc SP_INSERTARESTUDIANTE
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELA varchar(20)
as 
insert into Estudiante values (@NOMBRES,@APELLIDOS,@ESCUELA)

---PROCEDIMIENTO ALMACENADO EDITARESTUDIANTE

create proc SP_EDITARESTUDIANTE
@IDESTUDIANTE varchar(20),
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELA varchar(20)
as 
update Estudiante set Nombres=@NOMBRES,Apellidos=@APELLIDOS,Escuela=@ESCUELA
where IdEstudiante =@IDESTUDIANTE
---PROCEDIMIENTO ALMACENADO ELiminarESTUDIANTE
CREATE PROC SP_ELIMINARESTUDIANTE
@IDESTUDIANTE int
as 
delete Estudiante
Where IdEstudiante=@IDESTUDIANTE
----Listing Student
create proc SP_LISTARESTUDIANTE
as
select top 100 
Estudiante.IdEstudiante,
Estudiante.CodEstudiante,
Estudiante.Nombres,
Estudiante.Apellidos,
Estudiante.Escuela
from Estudiante
order by IdEstudiante asc
select * from Estudiante

---------------------------------
---Procedimientos almacenados para Docente
----Stored Procedures for search Docente
CREATE PROC SP_BUSCARDOCENTE
@BUSCAR varchar(20)
as
select * from Docente
where Nombres like @BUSCAR + '%'
---Stored Procedures for insert Docente
-- drop procedure SP_INSERTARDOCENTE
create proc SP_INSERTARDOCENTE
@NOMBRES varchar(30),
@APELLIDOS varchar(30),
@TITULO varchar(70),
@FACULTAD varchar(90),
@EPROFESIONAL varchar(70),
@CATEGORIA varchar (60)
as
insert into Docente values(@NOMBRES,@APELLIDOS,@TITULO,@FACULTAD,@EPROFESIONAL,@CATEGORIA)
------- Stored Procedures for update Docente
-- drop procedure  SP_EDITARDOCENTE 
create proc SP_EDITARDOCENTE
@IDDOCENTE int,
@NOMBRES varchar(30),
@APELLIDOS varchar(30),
@TITULO varchar(70),
@FACULTAD varchar(90),
@EPROFESIONAL varchar(70),
@CATEGORIA varchar (60)
as 
update Docente set Nombres=@NOMBRES,Apellidos=@APELLIDOS,TituloAcademico=@TITULO,Facultad=@FACULTAD,EscuelaProfesional=@EPROFESIONAL,Categoria=@CATEGORIA
where IdDocente =@IDDOCENTE
---------Stored Procedures for delete docente
create proc SP_ELIMINARDOCENTE
@IDDOCENTE int
as
delete Docente
where IdDocente=@IDDOCENTE
------Stored Procedured for listing Docente
create proc SP_LISTARDOCENTE
as
select top 100 
Docente.IdDocente,
Docente.Nombres,
Docente.Apellidos,
Docente.TituloAcademico,
Docente.Facultad,
Docente.EscuelaProfesional,
Docente.Categoria
from Docente
order by IdDocente asc
select * from Docente

--exec SP_LISTARDOCENTE

--drop procedure SP_LISTARDOCENTE
--drop procedure SP_ELIMINARDOCENTE




select * from Docente
select * from Estudiante
exec SP_BUSCARDOCENTE 'a'
exec SP_LISTARESTUDIANTE
exec SP_INSERTARDOCENTE 'pepe','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'
exec SP_EDITARDOCENTE 3,'adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'

insert into Docente values ('juan','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
insert into Docente values ('joel','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
insert into Docente values ('adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')

ALTER TABLE Docente
ALTER COLUMN Facultad varchar(60);
ALTER TABLE Docente
ALTER COLUMN IdDocente int identity(1,1);
DELETE FROM Docente WHERE Nombres='adriana';]
drop table Docente

--Agregar docentes con datos reales
insert into Docente values ('Abdon','Ribas Puga','Licenciado en Fisico Matematicas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Ana Rocio','Cardenas Maita','Magister en Ciencias en Sistemas de Informacion','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Dennis Ivan','Candia Oviedo','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Doris Sabina','Aguirre Carbajal','Maestro en Ciencias: Ing de Sistemas con mencion en Ing de Software','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Edwin','Carrasco Poblete','Magister con Mencion en Ingenieria','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Efraina Gladys','Cutipa Arapa','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Emilio','Palomino Olivera','Magister con Mencion en Ingenieria','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Enrique','Gamarra Saldivar','Magister en Ciencias con Mencion en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Esther Cristina','Pacheco Vasquez','Licenciada en Fisico Matematicas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Guzman','Ticona Pari','Ingeniero Quimico','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Harley','Vera Olivera','Magister en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Henry Samuel','Dueñas De La Cruz','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Hernan','Castañeda Chirinos','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Hernan','Nina Hanco','Maestro en Administracion','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Ivan Cesar','Medrano Valencia','Ingeniero Quimico','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Javier Arturo','Rozas Huacho','Magister en Ciencias con Mencion en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Javier David','Chavez Centeno','Magister Scientiae en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Jose Mauro','Pillco Quispe','Licenciado en Fisico Matematicas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Julio Cesar','Carbajal Luna','Magister en Ciencias con Mencion en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Karelia','Medina Miranda','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Lauro','Enciso Rodas','Doctor en Ingenieria de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Lino Aquiles','Baca Cardenas','Ingeniero de Minas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Lino Prisciliano','Flores Pacheco','Magister en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Luis Alvaro','Monzon Condori','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Luis Beltran','Palma Ttito','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Manuel Aurelio','Peñaloza Figueroa','Ingeniero de Telecomunicaciones','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Maritza Katherine','Irpanocca Cusimayta','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Nila Zonia','Acurio Usca','Magister en Ciencias con Mencion en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Robert Wilbert','Alzamora Paredes','Master en Ingenieria Computacional y Sistemas Inteligentes','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Rony','Villafuerte Serna','Maestro en Ingenieria Computacional y Sistemas Inteligentes','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')

insert into Docente values ('Vanesa Maribel','Choque Soto','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Waldo Elio','Ibarra Zambrano','Maestro en Ciencias con Mencion en Informatica','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
insert into Docente values ('Waldo','Villa Rodriguez','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Willian','Zamalloa Paro','Ingeniero Informatico y de Sistemas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Contratado')
insert into Docente values ('Yeshica Isela','Ormeño Ayala','Master en Tecnologias Informaticas Avanzadas','Facultad de Ingenieria Electrica, Electronica, Informatica y Mecanica','Ingenieria Informatica y de Sistemas','Nombrado')
