class Users {
  final int id;
  final String name;
  final String email;

  Users({required this.id, required this.name, required this.email});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        email: json["email"],
        id: int.parse(json["id"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "id": id,
      };
}
