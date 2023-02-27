import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    // El scaffold contiene mas cosas en la pantalla aparte del contenedor
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        title: Text("Alert Page"),
      ),
      // En el body de la pagina pondremos un boton
      body: Center(
        child: TextButton(
          child: Text('Mostrar Alerta'),
          //textColor: Colors.white,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          // Creamos el metodo y por el metodo que vamos a implementar nececitamos afuerzas pasar el context
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      // Crear un boton para regresar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        child: Icon(Icons.arrow_circle_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // MEtodo para la accion del boton en body
  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      // En true para que se pueda salir de la alerta afuera con un tab
      barrierDismissible: true,
      // Esto crea el alerta
      builder: (context) {
        // Configuramo la caja de texto
        return AlertDialog(
          // Hacer que la alerta tenga bordes redondeados
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            // Para que la ventana no se alarge y se adapte al tamano del contenido interno
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              //Poner un logo de flutter
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
          // Agregar los botones
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              // Esto es para poder cerrar la ventana de alerta
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
