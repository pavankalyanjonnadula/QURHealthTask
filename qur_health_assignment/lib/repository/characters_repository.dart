import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qur_health_assignment/models/characters.dart';
import 'package:qur_health_assignment/networking/api_provider.dart';

class ApiRepository {
  final ApiProvider _provider = ApiProvider();

  Future<CharactersResponse> fetchCharacters(String apiUrl) async {
    debugPrint("APIURL $apiUrl");
    final response = await _provider.get(apiUrl);
    var characters = CharactersResponse.fromJson(response);
    return characters;
  }
}
