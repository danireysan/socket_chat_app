class UserModel {
  bool online;
  String email;
  String nombre;
  String uid;

  UserModel({
    required this.email,
    required this.nombre,
    required this.online,
    required this.uid,
  });

  // create from json method
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        nombre: json["nombre"],
        online: json["online"],
        uid: json["uid"],
      );

  // create to json method
  Map<String, dynamic> toJson() => {
        "email": email,
        "nombre": nombre,
        "online": online,
        "uid": uid,
      };
}
