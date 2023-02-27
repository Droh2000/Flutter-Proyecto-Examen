import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  @override
  _CheckboxPage createState() => _CheckboxPage();
}

class _CheckboxPage extends State<CheckboxPage> {
  bool? valuefirst = false;
  bool? valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 57, 57),
          title: Text('Checkbox de Pendientes'),
        ),
        body: Container(
            padding: new EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Cosas por hacer',
                  style: TextStyle(fontSize: 20.0),
                ),
                CheckboxListTile(
                  secondary: const Icon(Icons.alarm),
                  title: const Text('1:30 PM Junta con el jefe'),
                  subtitle: Text('Sonar 10 minutos antes'),
                  value: this
                      .valuefirst, // Vaalor por defecto que toma si esta o no seleccionado
                  onChanged: (bool? value) {
                    setState(() {
                      // Cambiar la seleccion
                      this.valuefirst = value;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  secondary: const Icon(Icons.alarm),
                  title: const Text('5:00 PM ir de compras'),
                  subtitle: Text('Sonar 10 minutos antes'),
                  value: this.valuesecond,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuesecond = value;
                    });
                  },
                ),
              ],
            )),
        // Crear un boton para regresar
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 58, 57, 57),
          child: Icon(Icons.arrow_circle_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
