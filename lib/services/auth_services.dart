import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class AuthService {
  String? token;
  static String baseUrl = '${dotenv.env["API_URL"]}:${dotenv.env["PORT"]}/api';
  
  Future<bool> login(String email, String password) async {

    final response = await http.post(Uri.parse('$baseUrl/login'),
      body: {
        'email' : email,
        'password' : password
      }
    );
      
    if (response.statusCode == 200){
      Map<String, dynamic> responseData = jsonDecode(response.body);
      token = responseData['data']['token'];
      return true;
    }else{
      return false;
    }
  }
}