## Conexión a base de datos Mysql (MariaDB)
```bash
# 1° Forma: Usando docker, ejecutar el sieguiente comando (SO windows 10 pro o superior)
$ docker container run --name mydb ^
	-dp 3306:3306 ^
	-e MARIADB_USER=example-user ^
	-e MARIADB_PASSWORD=user-password ^
	-e MARIADB_ROOT_PASSWORD=root-secret-password ^
	-e MARIADB_DATABASE=mydb ^
	--volume mydb:/var/lib/mysql:Z ^
	mariadb:jammy
# Credeciales:
	host: localhost
	user: example-user
	password: user-password
# 2° Forma: Teniendo ya instalada una versión de mysql, editar los datos de conexión en archivo de products_server '/src/data/mysql_config'
	** Ejecutar el suguiente sql para crear la BD y la tabla:
	-- Volcando estructura de base de datos para mydb
		CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
		USE `mydb`;

	-- Volcando estructura para tabla mydb.products
		CREATE TABLE IF NOT EXISTS `products` (
		  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
		  `name` varchar(50) DEFAULT NULL,
		  `price` int(10) unsigned DEFAULT NULL,
		  `description` text DEFAULT NULL,
		  PRIMARY KEY (`id`)
		) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```


## Servidor NodeJS con express (Se usó node versión 16.10.0)
```bash
# Ejecutar comando para instalar paquetes necesarios
$ npm install
# Ejecutar comando para levantar proyecto en modo local
$ npm run dev
```

## Proyecto Flutter
```bash
# Ejecutar comando para instalar paquetes necesarios
$ flutter packages get
# Nota 1: El proyecto solo ejecutará correctamente emulando dispositivo (no usar navagador o dispositivo físico).
# 		Esto debido a a las rutas del servidor (localhost:3000/...)
# Nota 2: Para eliminar, deslizar a la izquierda en uno de los items del producto.
```