class Stotos {
  BigInt idSegtoTos;
  String iSTMatricula;
  String gravedad;
  String fechaHora;

  Stotos(this.idSegtoTos,this.iSTMatricula, this.gravedad, this.fechaHora);

  factory Stotos.fromJson(dynamic json) {
    return Stotos(json['idSegtoTos'] as BigInt,json['iSTMatricula'] as String, json['gravedad'] as String, json['fechaHora'] as String);
  }

  @override
  String toString() {
    return '{ ${this.idSegtoTos},${this.iSTMatricula}, ${this.gravedad}, ${this.fechaHora} }';
  }
}