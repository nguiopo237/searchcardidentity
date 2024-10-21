// To parse this JSON data, do
//
//     final usersearch = usersearchFromJson(jsonString);

import 'dart:convert';

Usersearch usersearchFromJson(String str) => Usersearch.fromJson(json.decode(str));

String usersearchToJson(Usersearch data) => json.encode(data.toJson());

class Usersearch {
  String? status;
  List<Result>? result;

  Usersearch({
    this.status,
    this.result,
  });

  factory Usersearch.fromJson(Map<String, dynamic> json) => Usersearch(
    status: json["status"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  int? iduser;
  String? nom;
  String? prenom;
  String? email;
  String? gender;
  String? date;
  String? lieu;
  String? taille;
  String? profession;
  int? numerocni;
  String? phone;
  String? image;

  Result({
    this.iduser,
    this.nom,
    this.prenom,
    this.email,
    this.gender,
    this.date,
    this.lieu,
    this.taille,
    this.profession,
    this.numerocni,
    this.phone,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iduser: json["iduser"],
    nom: json["nom"],
    prenom: json["prenom"],
    email: json["email"],
    gender: json["Gender"],
    date: json["date"],
    lieu: json["lieu"],
    taille: json["taille"],
    profession: json["profession"],
    numerocni: json["numerocni"],
    phone: json["phone"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "iduser": iduser,
    "nom": nom,
    "prenom": prenom,
    "email": email,
    "Gender": gender,
    "date": date,
    "lieu": lieu,
    "taille": taille,
    "profession": profession,
    "numerocni": numerocni,
    "phone": phone,
    "image": image,
  };
}
