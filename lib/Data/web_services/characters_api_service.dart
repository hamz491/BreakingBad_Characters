import 'package:breakingbad_stars/core/constants/string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharactersApiService {
  late Dio dio;

  CharactersApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  getAlldata() async {
    try {
      Response response = await dio.get("character");
      debugPrint("==response[results]==>> ${response.data["results"]}");
      return response.data["results"];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
