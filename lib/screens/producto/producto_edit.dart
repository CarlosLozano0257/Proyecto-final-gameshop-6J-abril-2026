import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/producto_model.dart';
import '../../providers/producto_provider.dart';

class ProductoEdit extends StatefulWidget {
  final ProductoModel producto;
  const ProductoEdit({super.key, required this.producto});
  @override
  State<ProductoEdit> createState() => _ProductoEditState();
}

class _ProductoEditState extends State<ProductoEdit> {
  late final _nombre = TextEditingController(text: widget.producto.nombre);
  late final _precio = TextEditingController(
    text: widget.producto.precio.toString(),
  );
  late final _genero = TextEditingController(text: widget.producto.genero);
  late final _plataforma = TextEditingController(
    text: widget.producto.plataforma,
  );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductoProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text(
          'Editar Videojuego',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _input(_nombre, 'Nombre del juego', Icons.gamepad),
            const SizedBox(height: 14),
            _input(_precio, 'Precio (USD)', Icons.attach_money, num: true),
            const SizedBox(height: 14),
            _input(_genero, 'Género (Acción, RPG…)', Icons.category),
            const SizedBox(height: 14),
            _input(_plataforma, 'Plataforma (PC, PS5…)', Icons.computer),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                ),
                onPressed: () async {
                  final p = ProductoModel(
                    id: widget.producto.id,
                    nombre: _nombre.text,
                    precio: double.tryParse(_precio.text) ?? 0,
                    genero: _genero.text,
                    plataforma: _plataforma.text,
                  );
                  await provider.actualizar(p);
                  if (mounted) Navigator.pop(context);
                },
                child: const Text(
                  'ACTUALIZAR JUEGO',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(
    TextEditingController c,
    String label,
    IconData icon, {
    bool num = false,
  }) => TextField(
    controller: c,
    keyboardType: num ? TextInputType.number : TextInputType.text,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: const Color(0xFF6C63FF)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6C63FF)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 2),
      ),
    ),
  );
}
