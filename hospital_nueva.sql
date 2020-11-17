-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2020 a las 01:57:51
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `Id_Registro` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Id_Cargo` int(11) DEFAULT NULL,
  `Id_Turno` int(11) DEFAULT NULL,
  `Id_Incapacidad` int(11) DEFAULT NULL,
  `Id_Vacacion` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `HoraEntrada` datetime DEFAULT NULL,
  `HoraSalida` datetime DEFAULT NULL,
  `HoraComidaInicio` datetime DEFAULT NULL,
  `HoraComidaFin` datetime DEFAULT NULL,
  `Falta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `Id_Cargo` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `NombreDepartamento` varchar(40) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Sueldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` float DEFAULT NULL,
  `idHospital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `ApPaterno` varchar(30) DEFAULT NULL,
  `ApMaterno` varchar(30) DEFAULT NULL,
  `razonSocial` varchar(30) DEFAULT NULL,
  `Genero` varchar(1) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `Calle` varchar(30) DEFAULT NULL,
  `NoExt` varchar(10) DEFAULT NULL,
  `NoInt` varchar(10) DEFAULT NULL,
  `Colonia` varchar(30) DEFAULT NULL,
  `Municipio` varchar(30) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_Compra` int(11) NOT NULL,
  `id_Proveedor` int(11) DEFAULT NULL,
  `FechaHora_Compra` datetime DEFAULT NULL,
  `Total_Compra` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacitas`
--

CREATE TABLE `cuentacitas` (
  `idCuentaCita` int(11) NOT NULL,
  `idCita` int(11) NOT NULL,
  `idMedicamento` int(11) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idServicio` int(11) DEFAULT NULL,
  `idEspecialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deducciones`
--

CREATE TABLE `deducciones` (
  `Id_Deduccion` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Monto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id_Empleado` int(11) NOT NULL,
  `clave` varchar(6) DEFAULT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `ApPat` varchar(20) DEFAULT NULL,
  `ApMat` varchar(20) DEFAULT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Calle` varchar(20) DEFAULT NULL,
  `Noext` int(11) DEFAULT NULL,
  `Noint` int(11) DEFAULT NULL,
  `Colonia` varchar(40) DEFAULT NULL,
  `Municipio` varchar(30) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `CURP` varchar(16) DEFAULT NULL,
  `Genero` varchar(30) DEFAULT NULL,
  `Cedula_profesional` int(50) DEFAULT NULL,
  `Telefono` int(50) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id_Empleado`, `clave`, `Nombre`, `ApPat`, `ApMat`, `Fecha_Nac`, `Calle`, `Noext`, `Noint`, `Colonia`, `Municipio`, `Estado`, `RFC`, `CURP`, `Genero`, `Cedula_profesional`, `Telefono`, `Email`) VALUES
(2, '1313', 'Rene', 'Valle', 'Valle', '2000-09-05', 'Calle 8', 1, 1, 'lagos', 'Zumpango', 'Mexico', 'VAFC12345', 'VAFC1234567', 'Masculino', 676767, 55996633, 'correo@gmail.com'),
(3, '12345', 'Panchito', 'Vasquez ', 'Tamaño', '1998-02-20', 'paseos de la cereza', 1, 1, 'Santa tresa', 'Huehuetoca', 'Mexico', 'AFVR121212', 'VAFC12121212', 'Masculino', 12341111, 5577233, 'cjb@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `idHospital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_Factura` int(11) NOT NULL,
  `id_Cliente` int(11) DEFAULT NULL,
  `id_Venta` int(11) DEFAULT NULL,
  `FechaHora_factura` datetime DEFAULT NULL,
  `Folio_Fiscal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacias`
--

CREATE TABLE `farmacias` (
  `idFarmacia` int(11) NOT NULL,
  `razonSocial` varchar(30) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `redSocial` varchar(20) DEFAULT NULL,
  `Calle` varchar(20) DEFAULT NULL,
  `NoExt` int(11) DEFAULT NULL,
  `NoInt` int(11) DEFAULT NULL,
  `Colonia` varchar(40) DEFAULT NULL,
  `Municipio` varchar(40) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitales`
--

CREATE TABLE `hospitales` (
  `Id_Hospital` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Calle` varchar(20) DEFAULT NULL,
  `Noext` int(11) DEFAULT NULL,
  `Noint` int(11) DEFAULT NULL,
  `Colonia` varchar(40) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Municipio` varchar(30) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Sitioweb` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incapacidades`
--

CREATE TABLE `incapacidades` (
  `Id_Incapacidad` int(11) NOT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Motivo` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `nombre`, `email`, `password`) VALUES
(1, 'Jimmy Vasquez', 'cjvasquez_98@hotmail.com', '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `idMaterial` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipoMaterial` varchar(20) DEFAULT NULL,
  `fechaCaducidad` date DEFAULT NULL,
  `precio` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `formula` varchar(30) DEFAULT NULL,
  `presentacion` varchar(30) DEFAULT NULL,
  `gramaje` varchar(30) DEFAULT NULL,
  `laboratorio` varchar(30) DEFAULT NULL,
  `fechaCaducidad` date DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `precio` decimal(4,2) DEFAULT NULL,
  `viaAdministracion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_compras`
--

CREATE TABLE `nota_compras` (
  `Id_Nota` int(11) NOT NULL,
  `Id_Compra` int(11) NOT NULL,
  `Id_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_ventas`
--

CREATE TABLE `nota_ventas` (
  `Id_NotaVenta` int(11) NOT NULL,
  `id_Venta` int(11) NOT NULL,
  `id_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordendepagos`
--

CREATE TABLE `ordendepagos` (
  `Consecutivo` int(11) NOT NULL,
  `Id_Pago` int(11) NOT NULL,
  `Id_Percepcion` int(11) DEFAULT NULL,
  `Id_Deduccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `Id_Paciente` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `APaterno` varchar(20) DEFAULT NULL,
  `AMaterno` varchar(20) DEFAULT NULL,
  `CURP` varchar(20) DEFAULT NULL,
  `CorreoElectronico` varchar(25) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `ContactoEmergencia` varchar(30) DEFAULT NULL,
  `TelefonoEmergencia` int(11) DEFAULT NULL,
  `Genero` varchar(15) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Calle` varchar(20) DEFAULT NULL,
  `NoExt` int(11) DEFAULT NULL,
  `NoInt` int(11) DEFAULT NULL,
  `Colonia` varchar(20) DEFAULT NULL,
  `Municipio` varchar(20) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `CodigoPostal` int(5) DEFAULT NULL,
  `RFC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `Id_Pago` int(11) NOT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `DiasLaborados` datetime DEFAULT NULL,
  `TotalPercepciones` float DEFAULT NULL,
  `TotalDeducciones` float DEFAULT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Id_Cargo` int(11) DEFAULT NULL,
  `NetoPagado` float DEFAULT NULL,
  `SueldoBruto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `percepciones`
--

CREATE TABLE `percepciones` (
  `Id_Percepcion` int(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Monto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Formula` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `Presentacion` varchar(50) DEFAULT NULL,
  `Gramaje` varchar(30) DEFAULT NULL,
  `Marca` varchar(30) DEFAULT NULL,
  `Fecha_caducidad` datetime DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Via_administracion` varchar(30) DEFAULT NULL,
  `Precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `RazonSocial` varchar(30) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `Municipio` varchar(30) DEFAULT NULL,
  `Colonia` varchar(30) DEFAULT NULL,
  `Calle` varchar(30) DEFAULT NULL,
  `NoExt` varchar(10) DEFAULT NULL,
  `NoInt` varchar(10) DEFAULT NULL,
  `Cp` varchar(5) DEFAULT NULL,
  `SM` varchar(10) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Id_Servicio` int(11) NOT NULL,
  `NombreServicio` varchar(40) DEFAULT NULL,
  `Categoria` varchar(40) DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `Id_Turno` int(11) NOT NULL,
  `HoraI` datetime DEFAULT NULL,
  `HoraT` datetime DEFAULT NULL,
  `TotHoras` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones`
--

CREATE TABLE `vacaciones` (
  `Id_Vacacion` int(11) NOT NULL,
  `TipoVacacion` varchar(40) DEFAULT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Total_dias` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Id_Venta` int(11) NOT NULL,
  `id_Empleado` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `Fecha_Venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`Id_Registro`),
  ADD KEY `Id_Empleado` (`Id_Empleado`),
  ADD KEY `Id_Cargo` (`Id_Cargo`),
  ADD KEY `Id_Turno` (`Id_Turno`),
  ADD KEY `Id_Incapacidad` (`Id_Incapacidad`),
  ADD KEY `Id_Vacacion` (`Id_Vacacion`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`Id_Cargo`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `idHospital` (`idHospital`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_Compra`),
  ADD KEY `id_Proveedor` (`id_Proveedor`);

--
-- Indices de la tabla `cuentacitas`
--
ALTER TABLE `cuentacitas`
  ADD PRIMARY KEY (`idCuentaCita`,`idCita`),
  ADD KEY `idMedicamento` (`idMedicamento`),
  ADD KEY `idMaterial` (`idMaterial`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idServicio` (`idServicio`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indices de la tabla `deducciones`
--
ALTER TABLE `deducciones`
  ADD PRIMARY KEY (`Id_Deduccion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_Empleado`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`idEspecialidad`),
  ADD KEY `idHospital` (`idHospital`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_Factura`),
  ADD KEY `id_Cliente` (`id_Cliente`);

--
-- Indices de la tabla `farmacias`
--
ALTER TABLE `farmacias`
  ADD PRIMARY KEY (`idFarmacia`);

--
-- Indices de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  ADD PRIMARY KEY (`Id_Hospital`);

--
-- Indices de la tabla `incapacidades`
--
ALTER TABLE `incapacidades`
  ADD PRIMARY KEY (`Id_Incapacidad`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`idMaterial`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `nota_compras`
--
ALTER TABLE `nota_compras`
  ADD PRIMARY KEY (`Id_Nota`,`Id_Compra`),
  ADD KEY `Id_Compra` (`Id_Compra`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `nota_ventas`
--
ALTER TABLE `nota_ventas`
  ADD PRIMARY KEY (`Id_NotaVenta`,`id_Venta`),
  ADD KEY `id_Venta` (`id_Venta`),
  ADD KEY `id_Producto` (`id_Producto`);

--
-- Indices de la tabla `ordendepagos`
--
ALTER TABLE `ordendepagos`
  ADD PRIMARY KEY (`Consecutivo`,`Id_Pago`),
  ADD KEY `Id_Pago` (`Id_Pago`),
  ADD KEY `Id_Percepcion` (`Id_Percepcion`),
  ADD KEY `Id_Deduccion` (`Id_Deduccion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`Id_Paciente`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Id_Pago`),
  ADD KEY `Id_Empleado` (`Id_Empleado`),
  ADD KEY `Id_Cargo` (`Id_Cargo`);

--
-- Indices de la tabla `percepciones`
--
ALTER TABLE `percepciones`
  ADD PRIMARY KEY (`Id_Percepcion`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id_Servicio`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`Id_Turno`);

--
-- Indices de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD PRIMARY KEY (`Id_Vacacion`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Id_Venta`),
  ADD KEY `id_Empleado` (`id_Empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `Id_Registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentacitas`
--
ALTER TABLE `cuentacitas`
  MODIFY `idCuentaCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deducciones`
--
ALTER TABLE `deducciones`
  MODIFY `Id_Deduccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `farmacias`
--
ALTER TABLE `farmacias`
  MODIFY `idFarmacia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  MODIFY `Id_Hospital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incapacidades`
--
ALTER TABLE `incapacidades`
  MODIFY `Id_Incapacidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nota_compras`
--
ALTER TABLE `nota_compras`
  MODIFY `Id_Nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nota_ventas`
--
ALTER TABLE `nota_ventas`
  MODIFY `Id_NotaVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordendepagos`
--
ALTER TABLE `ordendepagos`
  MODIFY `Consecutivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `Id_Paciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Id_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `percepciones`
--
ALTER TABLE `percepciones`
  MODIFY `Id_Percepcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id_Servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `Id_Turno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `Id_Vacacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Id_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`),
  ADD CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`Id_Cargo`) REFERENCES `cargos` (`Id_Cargo`),
  ADD CONSTRAINT `asistencias_ibfk_3` FOREIGN KEY (`Id_Turno`) REFERENCES `turnos` (`Id_Turno`),
  ADD CONSTRAINT `asistencias_ibfk_4` FOREIGN KEY (`Id_Incapacidad`) REFERENCES `incapacidades` (`Id_Incapacidad`),
  ADD CONSTRAINT `asistencias_ibfk_5` FOREIGN KEY (`Id_Vacacion`) REFERENCES `vacaciones` (`Id_Vacacion`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`Id_Paciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`idHospital`) REFERENCES `hospitales` (`Id_Hospital`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `cuentacitas`
--
ALTER TABLE `cuentacitas`
  ADD CONSTRAINT `cuentacitas_ibfk_1` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamentos` (`idMedicamento`),
  ADD CONSTRAINT `cuentacitas_ibfk_2` FOREIGN KEY (`idMaterial`) REFERENCES `materiales` (`idMaterial`),
  ADD CONSTRAINT `cuentacitas_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`Id_Empleado`),
  ADD CONSTRAINT `cuentacitas_ibfk_4` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`Id_Servicio`),
  ADD CONSTRAINT `cuentacitas_ibfk_5` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`);

--
-- Filtros para la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `especialidades_ibfk_1` FOREIGN KEY (`idHospital`) REFERENCES `hospitales` (`Id_Hospital`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`idCliente`);

--
-- Filtros para la tabla `nota_compras`
--
ALTER TABLE `nota_compras`
  ADD CONSTRAINT `nota_compras_ibfk_1` FOREIGN KEY (`Id_Compra`) REFERENCES `compras` (`id_Compra`),
  ADD CONSTRAINT `nota_compras_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `nota_ventas`
--
ALTER TABLE `nota_ventas`
  ADD CONSTRAINT `nota_ventas_ibfk_1` FOREIGN KEY (`id_Venta`) REFERENCES `ventas` (`Id_Venta`),
  ADD CONSTRAINT `nota_ventas_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `ordendepagos`
--
ALTER TABLE `ordendepagos`
  ADD CONSTRAINT `ordendepagos_ibfk_1` FOREIGN KEY (`Id_Pago`) REFERENCES `pagos` (`Id_Pago`),
  ADD CONSTRAINT `ordendepagos_ibfk_2` FOREIGN KEY (`Id_Percepcion`) REFERENCES `percepciones` (`Id_Percepcion`),
  ADD CONSTRAINT `ordendepagos_ibfk_3` FOREIGN KEY (`Id_Deduccion`) REFERENCES `deducciones` (`Id_Deduccion`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`Id_Cargo`) REFERENCES `cargos` (`Id_Cargo`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_Empleado`) REFERENCES `empleados` (`Id_Empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
