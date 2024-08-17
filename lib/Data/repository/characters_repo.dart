// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/Data/web_services/characters_api_service.dart';
import 'package:flutter/material.dart';

class CharactersRepo {
  CharactersApiService charactersApiService;
  final List<Character> charactersList = [];
  CharactersRepo({required this.charactersApiService});

  Future<List<Character>> getAllCharacters() async {
    try {
      final characters = await charactersApiService.getAlldata();
      // list map<string,dynamic>
      debugPrint("==repo==>> $characters");
      for (var i in characters) {
        Character n = Character.fromJson(i as Map<String, dynamic>);
        charactersList.add(n);
      }
      return charactersList;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
