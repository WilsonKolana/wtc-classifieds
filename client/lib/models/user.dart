class User {
  String username;
  String useremail;
  int userid;
  bool userisActive;
  String usercampus;
  String userphone;
  // String token;

  int get id => userid;
  String get name => username;
  String get email => useremail;
  bool get isActive => userisActive;
  String get campus => usercampus;
  String get phone => userphone;

  User({
    required this.username,
    required this.useremail,
    required this.userphone,
    required this.usercampus,
    required this.userisActive,
    required this.userid,
  });
  // this.token = ""

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json["name"],
        useremail: json["email"],
        userid: json["id"],
        userisActive: json["is_active"],
        usercampus: json["campus"],
        userphone: json["phone"]);
  }
}
