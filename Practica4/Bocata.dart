class Bocata {
  int? id;
  String? ing;
  String? pan;
  String? tamanio;
  String? nombre;
  String? user;
  bool? gluten;

  Bocata( {this.id, this.ing, this.pan, this.tamanio, this.nombre, this.user, this.gluten});

  factory Bocata.fromJson(Map<String, dynamic> json) {
    return Bocata(
        id: json['id'] as int?,
        ing: json['ing'] as String?,
        pan: json['pan'] as String?,
        tamanio: json['tamanio'] as String?,
        nombre: json['nombre'] as String?,
        user: json['user'] as String?,
        gluten: json['sinGluten'] as bool?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'ing': ing,
      'pan': pan,
      'Tamanio': tamanio,
      'nombre': nombre,
      'user': user,
      'sinGluten': gluten
    };
  }

  @override
  String toString() {
    return "Ingredientes: $ing\nTipo de pan: $pan\nTamaño: $tamanio\n${gluten ?? false ? "Con Gluten" : "Sin Gluten"}";
  }
}
