import 'dart:convert';

import 'package:routine/models/lessons.dart';
import "package:http/http.dart" as http;

class LessonsController {
  Future<Lessons?> getLessons() async {
    const String baseUrl = "632017e19f82827dcf24a655.mockapi.io";
    const String endPoint = "/api/lessons";
    final uri = Uri.https(baseUrl, endPoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Lessons.fromJson(json);
    } else {
      return null;
    }
  }
}
