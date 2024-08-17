import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.mycharacter});
  final Character mycharacter;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    Widget customText(String titl, String value) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titl,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
      );
    }

    Widget customDivider(double value) {
      return Divider(
        color: MyColors.myYellow,
        endIndent: value,
        thickness: 5,
        height: 30,
      );
    }

    return Scaffold(
      body: Container(
        color: MyColors.myGray,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MyColors.myYellow,
              expandedHeight: screenHeight * .6,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "${mycharacter.name}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                background: Hero(
                  tag: mycharacter.id,
                  child: Image.network(
                    "${mycharacter.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText("Status:  ", "${mycharacter.status}"),
                        customDivider(280),
                        customText("Species:  ", "${mycharacter.species}"),
                        customDivider(260),
                        customText("Type:  ", "Cartoon"),
                        customDivider(300),
                        customText("Gender:  ", "${mycharacter.gender}"),
                        customDivider(200),
                        const SizedBox(height: 20),
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 7.0,
                                color: MyColors.myYellow,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FlickerAnimatedText(
                                '${mycharacter.name}',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * .55),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
