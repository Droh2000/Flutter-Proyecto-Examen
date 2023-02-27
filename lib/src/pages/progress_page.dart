import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        title: Text('Circulo Girando'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                "Indicador de progreso indeterminado",
                style: TextStyle(fontSize: 18),
              ),
              margin: EdgeInsets.all(20),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.purple,
                strokeWidth: 5,
              ),
            ),
          ],
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
}
