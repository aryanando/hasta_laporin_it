import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token'); // Returns null if not found
}

Future<bool> fetchUserData() async {
  final String apiUrl = 'https://api.batubhayangkara.com/api/v1/me';
  String? token = await getToken();

  if (token == null) {
    print("No token found, please log in.");
    return false;
  }

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // Include token in header
      },
    );

    if (response.statusCode == 200) {
      print('User Data: ${response.body}');
      return true;
    } else {
      print('Failed to fetch user data: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error fetching user data: $e');
  }

  return false;
}
