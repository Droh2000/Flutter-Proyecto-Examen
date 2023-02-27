import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  // Valor dinamico del slider
  double _valorSlider = 100.0;
  bool? _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        title: Text('Slider'),
      ),
      body: Container(
        // Aplicar una separacion arriba del slider
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            Expanded(
              // Lo pusimos en un expanded para que use todo su espacio posible
              child: _crearImagen(),
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

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamano de la imagen',
      //divisions: 20,
      value: _valorSlider, // valor por defecto que toma
      min: 10.0,
      max: 400.0,
      // Aqui ponemos la condicion para activar o desactivar el slider
      onChanged: (_bloquearCheck == true)
          ? null
          : (valor) {
              //print(valor);
              // Para que se apliquen los cambios
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/carga.gif'),
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg'),
      width: _valorSlider, // Que se adapte el tamano al valor del slider
      fit: BoxFit.contain, // para que la imagen no se salga de los margenes
    );
  }

  Widget _crearCheckbox() {
    // Cuando el checkbox este activo no podamos mover el slider
    return CheckboxListTile(
        title: Text('Bloquear el Slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
