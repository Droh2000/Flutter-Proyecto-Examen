// Este es el home pricipal
import 'package:flutter/material.dart';
import 'package:u1_proyectoexamen/src/pages/alert_page.dart';
import 'package:u1_proyectoexamen/src/pages/card_pages.dart';
import 'package:u1_proyectoexamen/src/pages/checkbox_page.dart';
import 'package:u1_proyectoexamen/src/pages/progress_page.dart';
import 'package:u1_proyectoexamen/src/pages/slider_page.dart';
import 'package:u1_proyectoexamen/src/pages/tab_page.dart';

class HomePage extends StatelessWidget {
  final opciones = ["alert", "tarjetas", "pestanas"];
  //const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Colors.black,
        actions: [
          Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg'),
                radius: 25.0,
              )),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            ListTile(
              title: const Text('Checkbox'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckboxPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Circular Progress'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Slider'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SliderPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: _crearItemsCorta(context),
      ),
    );
  }

  List<Widget> _crearItemsCorta(BuildContext context) {
    // Usar el metodo MAP que ya vienen en todas las listas
    // Cada uno de los elementos va a pasar por esa funcion anonima
    // esto nos regresara una nueva lista
    // Entre () poner el tipo de dato que sea la lista con el nombre del parametro que queramos
    return opciones
        .map((e) => Column(
              // Se agrego la columna para agregar mas cosas como el divide
              children: [
                ListTile(
                  title: Text(e),
                  // Mas widgets de ListTile
                  subtitle: Text("Subtitulo que sale abajo"),
                  leading: iconoLista(
                      e), // Icono que sale al lado del elemento de la lista
                  trailing: Icon(Icons
                      .keyboard_arrow_right), // Icono que sale al otro extremo de la lista
                  onTap: () {
                    Navigator.push(
                      context,
                      pantallaLista(e, context),
                    );
                  }, // Para dar el efecto al dar click sobre un elemento de la lista
                ),
                Divider(),
              ],
            ))
        .toList(); // El .toList para que sea del mismo tipo que retorna el metodo y no el pordefecto que es el iterable
  }

  Widget iconoLista(String e) {
    if (e == 'alert') {
      return Icon(Icons.access_alarms);
    }
    if (e == 'tarjetas') {
      return Icon(Icons.card_giftcard);
    }
    if (e == 'pestanas') {
      return Icon(Icons.menu_open);
    }
    return Icon(Icons.access_time_filled_outlined);
  }

  MaterialPageRoute pantallaLista(String e, BuildContext context) {
    if (e == 'alert') {
      return MaterialPageRoute(builder: (context) => const AlertPage());
    }
    if (e == 'tarjetas') {
      return MaterialPageRoute(builder: (context) => const CardPages());
    }
    if (e == 'pestanas') {
      return MaterialPageRoute(builder: (context) => const TabBarDemo());
    }
    return MaterialPageRoute(builder: (context) => HomePage());
  }
}
