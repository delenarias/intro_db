--Paso 1 Creación de base de datos
CREATE DATABASE naturaleza;

--Paso 2 Crear esquemas
CREATE SCHEMA animales;

CREATE SCHEMA plantas;

--Paso 3 Crear tablas en esquemas

--3.1 Creamos una tabla para clasificar las frutas
--DROP TABLE plantas.clasificacion_frutas CASCADE
--SELECT plantas.clasificacion_frutas
CREATE TABLE IF NOT EXISTS plantas.clasificacion_frutas
(
    id_clasificacion_fruta serial,
	nombre character varying(25) NOT NULL,
	descripcion text NULL,
    activo boolean NOT NULL DEFAULT true,
    fecha_creacion timestamp without time zone NOT NULL DEFAULT now(),
    fecha_actualizacion timestamp without time zone,
    usuario_creacion integer,
    usuario_actualizacion integer,
    CONSTRAINT pk_clasificacion_fruta PRIMARY KEY (id_clasificacion_fruta),
	CONSTRAINT uq_clasificacion_fruta UNIQUE(nombre)
);

COMMENT ON COLUMN plantas.clasificacion_frutas.id_clasificacion_fruta IS 'Identificador unico de la tabla';
COMMENT ON COLUMN plantas.clasificacion_frutas.nombre IS 'Nombre de la clasificacion';
COMMENT ON COLUMN plantas.clasificacion_frutas.descripcion IS 'Descripción alternativa';
COMMENT ON COLUMN plantas.clasificacion_frutas.activo IS 'Estado del registro activo=true, inactivo=false';

--3.2 Creamos una tabla de frutas y la relacionamos con la clasificación
--DROP TABLE plantas.frutas
--SELECT plantas.frutas
CREATE TABLE IF NOT EXISTS plantas.frutas
(
    id_fruta serial,
	id_clasificacion_fruta integer NOT NULL,
	nombre character varying(15) NOT NULL,
	frutos_x_arbol integer default 0,
	cosecha_temporada boolean NOT NULL DEFAULT false,
    activo boolean NOT NULL DEFAULT true,
    fecha_creacion timestamp without time zone NOT NULL DEFAULT now(),
    fecha_actualizacion timestamp without time zone,
    usuario_creacion integer,
    usuario_actualizacion integer,
    CONSTRAINT pk_frutas PRIMARY KEY (id_fruta),
	CONSTRAINT fk_frutas_clasificacion FOREIGN KEY (id_clasificacion_fruta) REFERENCES plantas.clasificacion_frutas(id_clasificacion_fruta)
);

COMMENT ON COLUMN plantas.frutas.id_fruta IS 'Identificador del criterio pga';
COMMENT ON COLUMN plantas.frutas.id_clasificacion_fruta IS 'Identificador del padre del criterio';
COMMENT ON COLUMN plantas.frutas.nombre IS 'Nombre de la fruta';
COMMENT ON COLUMN plantas.frutas.frutos_x_arbol IS 'Cantidad de frutos por arbol';
COMMENT ON COLUMN plantas.frutas.cosecha_temporada IS 'Identifica si la fruta cosecha solo en temporadas';
COMMENT ON COLUMN plantas.frutas.activo IS 'Estado del registro activo=true, inactivo=false';

--Paso 4. Insertamos datos en tablas
--4.1 Inserción en tabla Clasificación de frutas
INSERT INTO plantas.clasificacion_frutas(nombre,descripcion,usuario_creacion)
VALUES('Frutas acidas','Poseen gran cantidad de acidos beneficiosos',0);

INSERT INTO plantas.clasificacion_frutas(nombre,descripcion,usuario_creacion)
VALUES('Frutas semiacidas','Se caracterizan por un sabor suave',0);

INSERT INTO plantas.clasificacion_frutas(nombre,descripcion,usuario_creacion)
VALUES('Frutas neutras','Son las mas ricas en vitaminas,minerales y proteínas',0);

INSERT INTO plantas.clasificacion_frutas(nombre,descripcion,usuario_creacion)
VALUES('Frutas dulces','No contienen ácidos, pero si vitamonas A,C y E',0);

--4.2 Inserción en Tabla Frutas
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(1,'Kiwi',600,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(1,'limon',400,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(1,'piña',1,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(1,'manzana',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(1,'uva',350,true,0);
----
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'fresa',200,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'ciruela',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'membrillo',100,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'nispero',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'melocotón',200,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'mandarina',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(2,'mango',250,true,0);

----
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'coco',50,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'aguacate',500,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'aceituna',1000,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'almendra',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'nuez',200,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(3,'avellana',100,true,0);

----
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'banano',150,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'higo',300,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'melón',50,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'pera',250,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'sandía',20,true,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'cereza',300,false,0);
INSERT INTO plantas.frutas(id_clasificacion_fruta,nombre,frutos_x_arbol,cosecha_temporada,usuario_creacion) VALUES(4,'mamey',50,true,0);

--Paso 5. Hacer queries
--5.1 Listar las tablas
--Con * traemos todos los campos
select * from plantas.clasificacion_frutas

select * from plantas.frutas

--Tambien podemos seleccionar que campos queremos ver
select nombre,frutos_x_arbol from plantas.frutas

--Podemos ordenar en base a un campo
select * from plantas.frutas order by frutos_x_arbol desc
select * from plantas.frutas order by frutos_x_arbol asc

--Podemos limitar nuestro query
select * from plantas.frutas limit 5

--Unir dos tablas
select cf.nombre as clasificacion, f.nombre as fruta,frutos_x_arbol
from plantas.frutas f
inner join plantas.clasificacion_frutas cf on f.id_clasificacion_fruta=f.id_clasificacion_fruta

--Unir dos tablas y ordenarlas por clasificacion
select cf.nombre as clasificacion, f.nombre as fruta,frutos_x_arbol
from plantas.frutas f
inner join plantas.clasificacion_frutas cf on cf.id_clasificacion_fruta=f.id_clasificacion_fruta
order by cf.nombre

--Realizar conteo de frutas por clasificacion
select cf.nombre,count(f.*) as total
from plantas.frutas f
inner join plantas.clasificacion_frutas cf on cf.id_clasificacion_fruta=f.id_clasificacion_fruta
group by cf.nombre

--Mostrar frutas cuyo frutos por arbol son entre 200 y 400
select nombre,frutos_x_arbol
from plantas.frutas
where frutos_x_arbol between 200 and 400;

--Mostrar frutas que son por temporada
select *
from plantas.frutas
where cosecha_temporada=true;

--Actualizar una fruta 
update plantas.frutas
set nombre='Limón'
where id_fruta=2;

--Proyectar cosecha de frutas segun clasificacion por 1 año suponiendo frutos_x_arbol es mensual
select cf.nombre,sum((frutos_x_arbol*12)) as total_anual
from plantas.frutas f
inner join plantas.clasificacion_frutas cf on cf.id_clasificacion_fruta=f.id_clasificacion_fruta
group by cf.nombre

--Paso 6 Crear Vista general de frutas
--select * from plantas.vw_frutas
CREATE VIEW plantas.vw_frutas as
select cf.nombre as clasificacion, f.nombre as fruta,frutos_x_arbol,
case when cosecha_temporada=true then 'Cosecha en Temporada' else 'Cosecha Todo el año' end as cosecha
from plantas.frutas f
inner join plantas.clasificacion_frutas cf on cf.id_clasificacion_fruta=f.id_clasificacion_fruta
order by cf.nombre