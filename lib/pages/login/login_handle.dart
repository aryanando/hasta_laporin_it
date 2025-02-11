import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hasta_laporin_it/pages/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUser(String email, String password, BuildContext context,
    Function callback) async {
  final String apiUrl =
      'https://api.batubhayangkara.com/api/v1/login'; // Replace with your API URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['token']['token']; // Extract token from response

      // Save token in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

      print('Login successful: Token stored.'); // Handle token storage here
    } else {
      print('Login failed: ${response.body}');
      callback(true);
    }
  } catch (e) {
    print('Error during login: $e');
  }
}
