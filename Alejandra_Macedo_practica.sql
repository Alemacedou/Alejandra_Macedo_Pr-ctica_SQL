---PRÁCTICA MODULO SQL

----Creamos el esquema de trabajo

create schema alejandra_macedo authorization tcvshlft

---- Creamos las tablas

---Tabla modelo

create table alejandra_macedo.modelo(
	id_modelo integer not null, --PK 
	id_marca integer not null, -- FK 
	modelo varchar(50) not null 
);

alter table alejandra_macedo.modelo
add constraint pk_modelo primary key (id_modelo);


---Tabla marca

create table alejandra_macedo.marca(
	id_marca integer not null, --PK 
	id_grupo integer not null, -- FK 
	marca varchar(50) not null 
);

alter table alejandra_macedo.marca
add constraint pk_marca primary key (id_marca);


--- Tabla grupo grupo

create table alejandra_macedo.grupo(
	id_grupo integer not null, --PK 
	grupo varchar(50) not null 
);

alter table alejandra_macedo.grupo
add constraint pk_grupo primary key (id_grupo);

--- Tabla color

create table alejandra_macedo.color(
	id_color integer not null, --PK 
	color varchar(50) not null 
);

alter table alejandra_macedo.color
add constraint pk_color primary key (id_color);

--- Tabla aseguradora

create table alejandra_macedo.aseguradora(
	id_aseguradora integer not null, --PK 
	aseguradora varchar(50) not null 
);

alter table alejandra_macedo.aseguradora
add constraint pk_aseguradora primary key (id_aseguradora);

--- Tabla moneda

create table alejandra_macedo.moneda(
	id_moneda integer not null, --PK 
	moneda varchar(50) not null 
);

alter table alejandra_macedo.moneda
add constraint pk_moneda primary key (id_moneda);

--- Tabla coches

create table alejandra_macedo.coches(
	id_coche integer not null, --PK 
	id_modelo integer not null, --FK 
	id_color integer not null, --FK
	matricula varchar (15) not null,
	km_total integer not null,
	id_aseguradora integer not null, --FK 
	poliza integer not null, 
	fecha_compra date not null
);

alter table alejandra_macedo.coches
add constraint pk_coches primary key (id_coche);

--- Tabla revisiones

create table alejandra_macedo.revisiones(
	id_coche integer not null, --PK FK
	km_revision integer not null,
	fecha_revision date not null,
	id_moneda integer not null, --FK 
	precio integer not null 	
);

alter table alejandra_macedo.revisiones
add constraint pk_revision primary key (id_coche);

alter table alejandra_macedo.modelo
add constraint modelo foreign key (id_marca)
references alejandra_macedo.marca (id_marca);

alter table alejandra_macedo.marca
add constraint marca foreign key (id_grupo)
references alejandra_macedo.grupo (id_grupo);

alter table alejandra_macedo.coches
add constraint coches foreign key (id_modelo)
references alejandra_macedo.modelo (id_modelo);

alter table alejandra_macedo.coches 
add constraint color_coches foreign key (id_color)
references alejandra_macedo.color (id_color);

alter table alejandra_macedo.coches 
add constraint empresa_aseguradora foreign key (id_aseguradora)
references alejandra_macedo.aseguradora (id_aseguradora);

alter table alejandra_macedo.revisiones
add constraint tipo_moned foreign key (id_moneda)
references alejandra_macedo.moneda (id_moneda);

alter table alejandra_macedo.revisiones 
add constraint revision_coche foreign key (id_coche)
references alejandra_macedo.coches (id_coche);

--- VALORES TABLAS

--- aseguradoras

--insert into alejandra_macedo.aseguradora (id_aseguradora, aseguradora) values(

insert into alejandra_macedo.aseguradora (id_aseguradora, aseguradora) values('001','aseguradora1');
insert into alejandra_macedo.aseguradora (id_aseguradora, aseguradora) values('002','aseguradora2');
insert into alejandra_macedo.aseguradora (id_aseguradora, aseguradora) values('003','aseguradora3');

select from alejandra_macedo.aseguradora

-- monedas

insert into alejandra_macedo.moneda (id_moneda, moneda) values('001','EUR');
insert into alejandra_macedo.moneda (id_moneda, moneda) values('002','DÓLAR');

--- color 


insert into alejandra_macedo.color (id_color, color) values('001','negro');
insert into alejandra_macedo.color (id_color, color) values('002','blanco');
insert into alejandra_macedo.color (id_color, color) values('003','rojo');
insert into alejandra_macedo.color (id_color, color) values('004','azul');

--- grupo marca
insert into alejandra_macedo.grupo (id_grupo, grupo) values('001','grupo1');
insert into alejandra_macedo.grupo (id_grupo, grupo) values('002','grupo2');
insert into alejandra_macedo.grupo (id_grupo, grupo) values('003','grupo3');

--- marca
insert into alejandra_macedo.marca (id_marca, id_grupo, marca) values('001','001','marca1');
insert into alejandra_macedo.marca (id_marca, id_grupo, marca) values('002','002','marca2');
insert into alejandra_macedo.marca (id_marca, id_grupo, marca) values('003','003','marca4');

--- modelo

insert into alejandra_macedo.modelo (id_modelo, id_marca, modelo) values ('001','001','modelo1');
insert into alejandra_macedo.modelo (id_modelo, id_marca, modelo) values ('002','002','modelo2');
insert into alejandra_macedo.modelo (id_modelo, id_marca, modelo) values ('003','003','modelo3');
insert into alejandra_macedo.modelo (id_modelo, id_marca, modelo) values ('004','002','modelo4');
insert into alejandra_macedo.modelo (id_modelo, id_marca, modelo) values ('005','003','modelo5');

--- coches

insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('001','001','001','7512 RUN','15000','001','9591996','2018-12-12');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('002','001','002','2932 GBN','5000','002','9123456','2018-11-20');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('003','002','004','0641 DBU','10000','001','9835741','2021-01-15');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('004','002','003','1574 ZDJ','6000','003','9121544','2017-09-20');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('005','003','002','6277 CIN','7000','002','9789246','2019-09-26');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('006','003','001','2926 JKC','6500','002','9254879','2020-01-09');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('007','004','003','7242 NDC','2100','001','9487152','2019-11-25');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('008','004','001','1736 ZSL','3500','003','9364789','2012-03-15');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('009','005','004','3910 WJZ','4000','001','9484126','2015-06-07');
insert into alejandra_macedo.coches (id_coche, id_modelo, id_color, matricula, km_total, id_aseguradora, poliza, fecha_compra) values('010','005','002','8325 BOQ','5050','002','9781218','2018-09-18');

--- revisiones

insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('001','10000','2022-05-12','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('002','4500','2022-05-13','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('003','9500','2022-05-14','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('004','5600','2022-05-15','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('005','4300','2022-05-16','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('006','5200','2022-05-17','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('007','2000','2022-05-18','001','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('008','3000','2022-05-19','002','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('009','3000','2022-05-20','002','500');
insert into alejandra_macedo.revisiones(id_coche, km_revision, fecha_revision, id_moneda, precio) values('010','4500','2022-05-21','002','500');

select * from alejandra_macedo.coches
select * from alejandra_macedo.revisiones
