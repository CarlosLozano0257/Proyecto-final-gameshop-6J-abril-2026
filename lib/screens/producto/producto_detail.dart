import 'package:flutter/material.dart';
import '../../models/producto_model.dart';

class ProductoDetail extends StatelessWidget {
  final ProductoModel producto;
  const ProductoDetail({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(
          producto.nombre,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF6C63FF),
              child: Icon(Icons.videogame_asset, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 24),
            _row('Nombre', producto.nombre),
            _row('Precio', '\$${producto.precio}'),
            _row('Género', producto.genero),
            _row('Plataforma', producto.plataforma),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    ),
  );
}
