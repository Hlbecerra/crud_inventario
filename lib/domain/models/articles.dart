class Articulo {
  var foto;
  var detalle;
  var codigo;
  var cantidad;
  var estado;

  Articulo(
      {required this.foto,
      required this.detalle,
      required this.codigo,
      required this.cantidad,
      required this.estado});

  factory Articulo.desdeJson(Map jsonMap) {
    return Articulo(
        foto: jsonMap['foto'],
        detalle: jsonMap['detalle'],
        codigo: jsonMap['codigo'],
        cantidad: jsonMap['cantidad'],
        estado: jsonMap['estado']);
  }
}

var articulo1 = {
  'foto':
      'data:image/jpeg;base64,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',
  'detalle': 'Gafas de Sol',
  'codigo': 'GS0001',
  'cantidad': 30,
  'estado': true
};

var articulo2 = {
  'foto':
      'https://www.carlosnieto.com.co/wp-content/uploads/ZAPATO-AZUL-OSC-CORDON-GAMUZA-0021518-VISTA-1.jpg',
  'detalle': 'Zapatos Clasicos',
  'codigo': 'ZP0002',
  'cantidad': 15,
  'estado': false
};

var articulo3 = {
  'foto':
      'https://cdn.shopify.com/s/files/1/0311/9398/9260/products/true_cargo_multipocket_pants_black_pantalones_sudaderas_1_776423a6-c4ba-43aa-be88-cf671e38a3da_720x720.jpg?v=1669821939',
  'detalle': 'Pantalones Cargo Femenino',
  'codigo': 'PF0003',
  'cantidad': 9,
  'estado': true
};

List<Articulo> listaArticulos = [
  Articulo.desdeJson(articulo1),
  Articulo.desdeJson(articulo2),
  Articulo.desdeJson(articulo3)
];
