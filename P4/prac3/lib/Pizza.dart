class Pizza {
  int? id;
  String? ing;
  String? salsa;
  String? tipoMasa;
  String? tamanio;
  String? nombre;
  String? user;
  bool? gluten;

  Pizza({this.id, this.ing, this.salsa, this.tipoMasa, this.tamanio, this.nombre, this.user, this.gluten});

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'] as int?,
      ing: json['ing'] as String?,
      salsa: json['salsa'] as String?,
      tipoMasa: json['tipoMasa'] as String?,
      tamanio: json['tamanio'] as String?,
      nombre: json['nombre'] as String?,
      user: json['usuario'] as String?,
      gluten: json['gluten'] as bool?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ing': ing,
      'salsa': salsa,
      'tipoMasa': tipoMasa,
      'tamanio': tamanio,
      'nombre': nombre,
      'usuario': user,
      'gluten' : gluten
    };
  }

  @override
  String toString() {
    return "Ingredientes: $ing\nSalsa: $salsa\nTipo de masa: $tipoMasa\nTamaño: $tamanio\n${gluten ?? false ? "Con Gluten" : "Sin Gluten"}";
  }
}
