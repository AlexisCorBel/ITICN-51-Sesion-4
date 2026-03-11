import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {

  Future<List<User>> fetchUsers() async {

    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );

    if (response.statusCode == 200) {

      List data = json.decode(response.body);

      return data.map((user) => User.fromJson(user)).toList();

    } else {
      throw Exception("Error al cargar usuarios");
    }
  }
}