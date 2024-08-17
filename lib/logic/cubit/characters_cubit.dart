import 'package:bloc/bloc.dart';
import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:flutter/material.dart';
import 'package:breakingbad_stars/Data/repository/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepo repo;
  late List<Character> dataList;
  CharactersCubit(this.repo) : super(CharactersInitial());

  Future<List<Character>> fechAllCharacters() async {
    emit(CharactersLoading());

    try {
      var charactersList = await repo.getAllCharacters();
      emit(CharactersSuccess(characters: charactersList));
      debugPrint("======>>>> $charactersList");
      dataList = charactersList;
      return dataList;
    } catch (e) {
      emit(CharactersFailure(errorMessage: e.toString()));
      return [];
    }
  }
}
