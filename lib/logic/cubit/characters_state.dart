part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersSuccess extends CharactersState {
  final List<Character> characters;

  CharactersSuccess({required this.characters});
}

final class CharactersLoading extends CharactersState {}

final class CharactersFailure extends CharactersState {
  final String errorMessage;

  CharactersFailure({required this.errorMessage});
}
