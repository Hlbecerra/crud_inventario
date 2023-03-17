import 'package:flutter/material.dart';

respuestas(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('¡Alerta!'),
            content: Text('El articulo $mensaje'),
          ));
}
