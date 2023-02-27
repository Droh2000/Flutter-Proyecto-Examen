import 'package:flutter/material.dart';
import 'package:u1_proyectoexamen/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      // Quitar el bannner de arriba
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      // Aqui defenimos las rutas disponibles de nuestra aplicacion
      initialRoute: '/', // Configuramos la ruta incial que seria el Home
      routes: getAplicationRoutes(),
    );
  }
}
