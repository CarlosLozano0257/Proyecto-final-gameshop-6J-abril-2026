class ProductoModel {
  String? id;
  String nombre;
  double precio;
  String genero;
  String plataforma;

  ProductoModel({
    this.id,
    required this.nombre,
    required this.precio,
    required this.genero,
    required this.plataforma,
  });

  // De Firestore → objeto Dart
  factory ProductoModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductoModel(
      id: id,
      nombre: map['nombre'] ?? '',
      precio: (map['precio'] ?? 0).toDouble(),
      genero: map['genero'] ?? '',
      plataforma: map['plataforma'] ?? '',
    );
  }

  // De objeto Dart → Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'genero': genero,
      'plataforma': plataforma,
    };
  }
}
