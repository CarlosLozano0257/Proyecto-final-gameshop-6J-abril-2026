import 'package:flutter/material.dart';
import '../models/producto_model.dart';
import '../services/firestore_service.dart';

class ProductoProvider extends ChangeNotifier {
  final FirestoreService _fs = FirestoreService();

  Stream<List<ProductoModel>> getProductos() {
    return _fs.getProductos();
  }

  Future<void> agregar(ProductoModel p) async {
    await _fs.agregarProducto(p);
    notifyListeners();
  }

  Future<void> actualizar(ProductoModel p) async {
    await _fs.actualizarProducto(p);
    notifyListeners();
  }

  Future<void> eliminar(String id) async {
    await _fs.eliminarProducto(id);
    notifyListeners();
  }
}
