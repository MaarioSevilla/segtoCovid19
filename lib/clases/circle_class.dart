class Circle {
  String id;
  String idGrupo;
  String matriculaID;

  Circle({this.id, this.idGrupo, this.matriculaID});

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      id: json['id'] as String,
      idGrupo: json['idGrupo'] as String,
      matriculaID: json['matriculaID'] as String,
    );
  }
}