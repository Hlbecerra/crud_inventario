import 'package:crud_inventario/domain/models/articles.dart';
import 'package:flutter/material.dart';

class AddArticulo extends StatefulWidget {
  const AddArticulo({super.key});

  @override
  State<AddArticulo> createState() => _AddArticuloState();
}

class _AddArticuloState extends State<AddArticulo> {
  late TextEditingController controlDetalle;
  late TextEditingController controlCodigo;
  late TextEditingController controlCantidad;

  @override
  void initState() {
    controlDetalle = TextEditingController();
    controlCodigo = TextEditingController();
    controlCantidad = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Articulos'),
      ),
      body: Column(
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
              child: const Text('Adicionar')),
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
