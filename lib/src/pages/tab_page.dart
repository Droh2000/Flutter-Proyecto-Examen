import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 58, 57, 57),
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
              indicatorSize: TabBarIndicatorSize
                  .tab, // Forma del circulo que encierra la pestana seleccionada
              indicatorWeight: 10, // Alto de la barra
              // indicador que encierra en circulo la pestana
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creamos border
                  color: Colors.black), //Cambiamos el color de fondo
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Pestañas'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          // Crear un boton para regresar
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 58, 57, 57),
            child: Icon(Icons.arrow_circle_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
