import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/Data/repository/characters_repo.dart';
import 'package:breakingbad_stars/Data/web_services/characters_api_service.dart';
import 'package:breakingbad_stars/core/routes/routes.dart';
import 'package:breakingbad_stars/logic/cubit/characters_cubit.dart';
import 'package:breakingbad_stars/presentation/character_details/character_details_page.dart';
import 'package:breakingbad_stars/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepo repo;
  AppRouter() {
    repo = CharactersRepo(charactersApiService: CharactersApiService());
    charactersCubit = CharactersCubit(repo);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const HomePage(),
          ),
        );
      case Routes.characterDetails:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (context) => CharacterDetails(mycharacter: character),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Routes Here"),
            ),
          ),
        );
    }
  }
}
