class Validators {
  static String? nombre(String? v) {
    if (v == null || v.isEmpty) return 'El nombre es obligatorio';
    return null;
  }

  static String? precio(String? v) {
    if (v == null || v.isEmpty) return 'El precio es obligatorio';
    if (double.tryParse(v) == null) return 'Ingresa un número válido';
    return null;
  }
}
