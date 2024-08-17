import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/core/constants/my_colors.dart';
import 'package:breakingbad_stars/presentation/home/widgets/char_tile.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.characters,
    required this.searchedCharacters,
    required this.isSearching,
  });
  final List<Character> characters;
  final List<Character> searchedCharacters;
  final bool isSearching;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.myGray.withOpacity(.8),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: isSearching ? searchedCharacters.length : characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6),
            child: CharTile(
              myCharacter:
                  isSearching ? searchedCharacters[index] : characters[index],
            ),
          );
        },
      ),
    );
  }
}
