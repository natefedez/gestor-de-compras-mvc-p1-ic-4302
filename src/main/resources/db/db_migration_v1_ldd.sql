CREATE TABLE proveedor (

	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	nombre VARCHAR(100) NOT NULL,
	direccion VARCHAR(200) NOT NULL,
	telefono VARCHAR(20),
	PRIMARY KEY (id)
);

CREATE TABLE tipo (

	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE producto (

	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	nombre CHAR(100) NOT NULL,
	medida CHAR(20) NOT NULL,
	id_tipo NUMBER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_tipo) REFERENCES tipo(id)
);

CREATE TABLE compra(

    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    fecha DATE NOT NULL,
    id_proveedor NUMBER NOT NULL,
    FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
    PRIMARY KEY(id)
);

CREATE TABLE compra_producto(

    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY, 
    id_compra NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    cantidad INT NOT NULL,
    precio NUMBER NOT NULL,
    FOREIGN KEY(id_compra) REFERENCES compra(id),
    FOREIGN KEY(id_producto) REFERENCES producto(id),
    PRIMARY KEY(id)
);

CREATE TABLE historial(
	
	id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	operacion VARCHAR(100) NOT NULL,
	usuario VARCHAR(100) NOT NULL,
	nombre_tabla VARCHAR(100),
	id_tabla NUMBER,
	datos_anteriores VARCHAR(1000),
	datos_nuevos VARCHAR(1000),
	
	PRIMARY KEY (id)
);