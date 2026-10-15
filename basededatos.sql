//*CLIENTES
PK = clave primaria
id_cliente (PK)
nombre, apellido, documento, telefono, email, direccion
EMPLEADOS
id_empleado (PK)
nombre, apellido, documento, cargo, sueldo, fecha_ingreso, estado
PROVEEDORES
id_proveedor (PK)
nombre, telefono, email, direccion
PRODUCTOS
id_producto (PK)
nombre, descripcion, precio, stock, id_proveedor (FK)
COMPRAS
id_compra (PK)
fecha, total, id_proveedor (FK), id_empleado (FK)
VENTAS
id_venta (PK)
fecha, total, id_cliente (FK), id_empleado (FK) *//

CREATE DATABASE tienda;
USE tienda;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documento VARCHAR(20) UNIQUE,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documento VARCHAR(20) UNIQUE,
    cargo VARCHAR(50),
    sueldo DECIMAL(10,2) NOT NULL,
    fecha_ingreso DATE,
    estado VARCHAR(20) DEFAULT 'Activo'
);

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor)
        REFERENCES Proveedores(id_proveedor)
);


CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    id_proveedor INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_proveedor)
        REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_empleado)
        REFERENCES Empleados(id_empleado)
);


CREATE TABLE Detalle_Compra (
    id_compra INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_compra, id_producto),
    FOREIGN KEY (id_compra)
        REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto)
);
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME ,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    id_cliente INT,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado)
        REFERENCES Empleados(id_empleado)
);
CREATE TABLE Detalle_Venta (
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta)
        REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto)
);
