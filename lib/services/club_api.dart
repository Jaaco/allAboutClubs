import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/club.dart';

class ClubApi {
  String endpoint = 'https://public.allaboutapps.at/hiring/clubs.json';

  Future<List<Club>> fetchClubs() async {
    Response response;
    try {
      response = await http.get(Uri.parse(endpoint));
    } catch (_) {
      return [];
    }

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => Club.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Clubs');
    }
  }
}
