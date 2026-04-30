import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/producto_model.dart';

class FirestoreService {
  final _col = FirebaseFirestore.instance.collection('productos');

  Stream<List<ProductoModel>> getProductos() {
    return _col
        .orderBy('nombre')
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => ProductoModel.fromMap(d.data(), d.id))
              .toList(),
        );
  }

  Future<void> agregarProducto(ProductoModel p) async {
    await _col.add(p.toMap());
  }

  Future<void> actualizarProducto(ProductoModel p) async {
    await _col.doc(p.id).update(p.toMap());
  }

  Future<void> eliminarProducto(String id) async {
    await _col.doc(id).delete();
  }
}
