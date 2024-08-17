// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:breakingbad_stars/core/routes/app_router.dart';

void main() {
  runApp(MyApp(approuter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.approuter});
  final AppRouter approuter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: approuter.generateRoute,
    );
  }
}
