import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:routine/models/programs.dart';

class ProgramsController {
  Future<Programs?> getPrograms() async {
    const String baseUrl = "632017e19f82827dcf24a655.mockapi.io";
    const String endPoint = "/api/programs";
    final uri = Uri.https(baseUrl, endPoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Programs.fromJson(json);
    } else {
      return null;
    }
  }
}
