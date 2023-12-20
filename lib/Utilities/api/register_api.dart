import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/Models/user.dart';

class Api {
  static const baseUrl = "http://localhost:3000/api";
  static const headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<http.Response> registerUser(User user) {
    
    return http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
  }
}
