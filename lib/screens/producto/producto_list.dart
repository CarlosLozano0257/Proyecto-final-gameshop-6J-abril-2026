import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/producto_provider.dart';
import '../../models/producto_model.dart';
import 'producto_create.dart';
import 'producto_edit.dart';
import 'producto_detail.dart';

class ProductoList extends StatelessWidget {
  const ProductoList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductoProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text(
          '🎮 GameShop — Catálogo',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6C63FF),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductoCreate()),
        ),
      ),
      body: StreamBuilder<List<ProductoModel>>(
        stream: provider.getProductos(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (!snap.hasData || snap.data!.isEmpty)
            return const Center(
              child: Text(
                'Sin juegos aún. Toca + para agregar.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snap.data!.length,
            itemBuilder: (ctx, i) {
              final p = snap.data![i];
              return Card(
                color: const Color(0xFF1A1A2E),
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFF6C63FF), width: .5),
                ),
                child: ListTile(
                  onTap: () => Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (_) => ProductoDetail(producto: p),
                    ),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF6C63FF),
                    child: Icon(Icons.videogame_asset, color: Colors.white),
                  ),
                  title: Text(
                    p.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '\$${p.precio} | ${p.genero} | ${p.plataforma}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Color(0xFF6C63FF)),
                        onPressed: () => Navigator.push(
                          ctx,
                          MaterialPageRoute(
                            builder: (_) => ProductoEdit(producto: p),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => provider.eliminar(p.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
