import 'package:crud_inventario/domain/models/articles.dart';
import 'package:flutter/material.dart';

class Modificar extends StatefulWidget {
  final Articulo _articulo;

  const Modificar(this._articulo, {super.key});

  @override
  State<Modificar> createState() => _ModificarState();
}

class _ModificarState extends State<Modificar> {
  late TextEditingController controlDetalle;
  late TextEditingController controlCodigo;
  late TextEditingController controlCantidad;

  @override
  void initState() {
    Articulo art = widget._articulo;
    controlDetalle = TextEditingController(text: art.detalle);
    controlCodigo = TextEditingController(text: art.codigo);
    controlCantidad = TextEditingController(text: art.cantidad.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Articulo'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textos(
                controlador: controlDetalle, titulo: 'Ingrese la Descripcion'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Textos(controlador: controlCodigo, titulo: 'Ingrese la Codigo'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textos(
                controlador: controlCantidad, titulo: 'Ingrese la Cantidad'),
          ),
          OutlinedButton(
              onPressed: () {
                var detalle = controlDetalle.text;
                var codigo = controlCodigo.text;
                var cantidad = controlCantidad.text;
                if (detalle.isNotEmpty &&
                    codigo.isNotEmpty &&
                    cantidad.isNotEmpty) {
                  Navigator.pop(
                      context,
                      Articulo(
                          foto: "",
                          detalle: detalle,
                          codigo: codigo,
                          cantidad: cantidad,
                          estado: true));
                }
              },
              child: const Text('Modificar')),
        ],
      ),
    );
  }
}

class Textos extends StatelessWidget {
  const Textos({
    super.key,
    required this.controlador,
    required this.titulo,
  });

  final TextEditingController controlador;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      decoration: InputDecoration(
          filled: true,
          labelText: titulo,
          suffix: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () {
              controlador.clear();
            },
          )),
    );
  }
}
