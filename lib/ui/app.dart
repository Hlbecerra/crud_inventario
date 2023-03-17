import 'package:crud_inventario/ui/pages/articulos/listar_articulos.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Inventario',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ListarArticulos(),
    );
  }
}
