import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/core/constants/my_colors.dart';
import 'package:breakingbad_stars/core/routes/routes.dart';
import 'package:flutter/material.dart';

class CharTile extends StatelessWidget {
  const CharTile({super.key, required this.myCharacter});
  final Character myCharacter;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.characterDetails,
          arguments: myCharacter,
        );
      },
      child: Hero(
        tag: myCharacter.id,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  image: DecorationImage(
                    image: NetworkImage("${myCharacter.image}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.black.withOpacity(.6),
                child: Center(
                  child: Text(
                    "${myCharacter.name}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
