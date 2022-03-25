class User {
  String name;
  String email;
  int id;
  bool isActive;
  String campus;
  String phone;
  // String token;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.campus,
    required this.isActive,
    required this.id,
  });
  // this.token = ""

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"],
        email: json["email"],
        id: json["id"],
        isActive: json["is_active"],
        campus: json["campus"],
        phone: json["phone"]);
  }
}
