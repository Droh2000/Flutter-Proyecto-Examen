import 'package:flutter/material.dart';

// Esta es la venta que se nos abrira al dar click en la lista la parte de Cards
class CardPages extends StatelessWidget {
  const CardPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        title: Text('Card'),
      ),
      // En body es todo el espacio blanco de la App
      // Como queremos crear muchas tarjetas las vamos a meter dentro de un ListView
      body: ListView(
        // EL padding es la distancia desde los bordes hacia adentro
        // Con all() ponemos un padding en todas las direcciones
        // .symmetric() la separacion aplica de forma simetrica horizontal (En los lados) o vertical (rriba y abajo)
        padding: EdgeInsets.all(10.0),
        // Va a tener un largo Statico por eso no creamos un ListBuilder
        children: [
          _cardTipo1(),
          // Poner espacio entre cada tarjeta
          SizedBox(height: 30.0),
          _cardTipo2(),
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
    );
  }

  Widget _cardTipo1() {
    /* Aqui vamos a retornar una tarjeta*/
    return Card(
      // Propiedades de estilo
      elevation:
          10.0, // Que tan alta va a estar la tarjeta en relaciona  la sombra (0 es sin borde, con 10 se da una sombra de fondo)
      //Cambiar los bordes (Entre mayor sea los de .cricular(Num) es para tener los bordes mas criculare)
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            // Agregamos un icono a la esquina de la tarjeta
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Este es un texto mas largo de toda la tarjeta que solo esta aqui por que si y ya no se que mas escribir'),
          ),
          // Queremos poner botones abajo
          // DE manera horizontal por eso el Row
          Row(
            // Queremos que el aligment este al otro lado de la tarjeta
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(child: Text("Cancelar"), onPressed: () {}),
              TextButton(child: Text("Ok"), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    // Tarjeta con una imagen (Poner algo para cuando este cargando para conseguir la imagen)

    // Vamos a poner la tarjeta dentro de un contenedor
    // con este final card
    final card = //Card( (Cambiamos la tarjeta por el container para adaptar mejor los bordes)
        Container(
      child: Column(
        children: [
          // Para que la imagen no tarde en cargar
          // Antes de hacer esto tenemos que hacer un RESTART completo al usar recursos locales asi y para que no de ERROR (Stop y F5)
          FadeInImage(
            // Nosotros tenemos en este caso una imagen .gif en la carpeta assets
            // La tenemos que agregar primero en el .yaml
            placeholder: AssetImage(
                'assets/carga.gif'), // esta es la imagen que cargara mientras no carga la imagen de la URL
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg'),
            // Para que no tarde mucho en cargar la imagen
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0, // Para tenga un tamano por defecto
            fit: BoxFit
                .cover, // Para que la imagen ocupe el espacion que tenga que ocupar (Asi se adapta con todo el ancho posible y mejora al cambiar arriba por container)
          ),
          /*Image(
            // Al usar estas imagenes por URL tardan en crgan al entrar en la APP
            image: /NetworkImage('https://upload.wikimedia.org/wikipedia/commons/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg')
          ),*/
          // Esto saldra abajo de la imagen
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'),
          ),
        ],
      ),
    );
    // Con conenedor no cambia en nada el diseno es como si fuera un DIV
    // Conservando el ancho y alto por defecto del contenido
    return Container(
      // Aqui pusimos el contenier por la decoracion
      // Para RESOLVER el problema que la imagen y la tarjeta no respeta el borde
      // Con este que esta en child costamos todo lo que este fuer
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white, // Para que no tenga ese efecto transparente
        // Agregar un efecto de sombra en el contorno de la imagen
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0, // Tamano de la sombre
              spreadRadius: 2.0, // LA forma en que se expande
              offset: Offset(2.0,
                  10.0) // Posision en plano cartesiano invertido para mover la sombra
              ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
