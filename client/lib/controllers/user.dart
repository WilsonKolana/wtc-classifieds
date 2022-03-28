import 'dart:convert';

import 'package:http/http.dart' as http;

class UserController {
  final String _url = "http://ea49-41-193-194-112.ngrok.io/api/";

  Future<int> signup({
    required String name,
    required String surname,
    required String phone,
    required String campus,
    required String email,
    required String password,
  }) async {
    Map data = {
      "email": email,
      "name": name,
      "surname": surname,
      "phone": phone,
      "campus": campus,
      "password": password,
    };

    final response = await http.post(Uri.parse(_url + "users"),
        body: json.encode(data),
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        });

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception(response.body);
    }
  }
}
