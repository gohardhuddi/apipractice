import 'dart:convert';

import 'package:http/http.dart' as http;

class UniversityServices {
  Future<dynamic> getUniversitiesService() async {
    final response = await http.get(
      Uri.parse("http://universities.hipolabs.com/search?country=Pakistan"),
      headers: {
        'Content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final requestbody = json.decode(response.body);
      return requestbody;
    } else {}
  }
}
