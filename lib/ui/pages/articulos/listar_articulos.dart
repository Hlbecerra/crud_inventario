import 'package:crud_inventario/domain/models/articles.dart';
import 'package:crud_inventario/ui/pages/articulos/add.dart';
import 'package:crud_inventario/ui/pages/articulos/modificar.dart';
import 'package:crud_inventario/ui/pages/articulos/respuestas.dart';
import 'package:flutter/material.dart';

class ListarArticulos extends StatefulWidget {
  const ListarArticulos({super.key});

  @override
  State<ListarArticulos> createState() => _ListarArticulosState();
}

class _ListarArticulosState extends State<ListarArticulos> {
  final List _listaArticulos = listaArticulos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Articulos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const AddArticulo()))
                    .then((art) {
                  if (art != null) {
                    setState(() {
                      _listaArticulos.add(art);
                      respuestas(
                          context, '${art.codigo} se agrego correctamente.');
                    });
                  }
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: _listaArticulos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Modificar(_listaArticulos[index])))
                  .then((newArticulo) {
                if (newArticulo != null) {
                  setState(() {
                    _listaArticulos.removeAt(index);
                    _listaArticulos.insert(index, newArticulo);
                    respuestas(context,
                        '${newArticulo.codigo} fue modificado correctamente.');
                  });
                }
              });
            },
            onLongPress: () {
              eliminarArticulo(context, _listaArticulos[index]);
            },
            title: Text(_listaArticulos[index].detalle),
            subtitle: Text(_listaArticulos[index].codigo),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_listaArticulos[index].foto),
            ),
            trailing: CircleAvatar(
              radius: 15.0,
              backgroundColor: (_listaArticulos[index].estado)
                  ? Colors.greenAccent
                  : Colors.redAccent,
              child: (_listaArticulos[index].estado)
                  ? Text(_listaArticulos[index].cantidad.toString())
                  : const Text('0'),
            ),
          );
        },
      ),
    );
  }

  eliminarArticulo(BuildContext context, Articulo art) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Articulo'),
              content: Text('Seguro desea elminiar el articulo: ${art.codigo}'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _listaArticulos.remove(art);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                )
              ],
            ));
  }
}
