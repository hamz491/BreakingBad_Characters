import 'package:breakingbad_stars/Data/models/characters_model.dart';
import 'package:breakingbad_stars/core/constants/my_colors.dart';
import 'package:breakingbad_stars/logic/cubit/characters_cubit.dart';
import 'package:breakingbad_stars/presentation/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> characters = [];
  List<Character> searchedCharacters = [];
  bool isSearching = false;
  late String searchedWord;
  final _searchcontroloer = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).fechAllCharacters();
  }

  Widget myTextField() {
    return TextFormField(
      style: const TextStyle(color: MyColors.myGray, fontSize: 18),
      controller: _searchcontroloer,
      cursorColor: MyColors.myGray,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Search Character",
        hintStyle: TextStyle(
          color: MyColors.myGray,
          fontSize: 19,
        ),
      ),
      onChanged: (searchedWord) {
        storeFilterdCharacters(searchedWord);
      },
    );
  }

  storeFilterdCharacters(String searchedWord) {
    searchedCharacters = characters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedWord))
        .toList();
    setState(() {});
  }

  List<Widget>? searchButton() {
    return [
      IconButton(
        onPressed: () {
          isSearching = true;
          setState(() {});
        },
        icon: const Icon(
          Icons.search,
          size: 30,
        ),
      ),
    ];
  }

  List<Widget>? clearButton() {
    return [
      IconButton(
        onPressed: () {
          isSearching = false;
          searchedCharacters.clear();
          setState(() {});
        },
        icon: const Icon(
          Icons.clear,
          size: 30,
        ),
      ),
    ];
  }

  Widget? noSearchTitle() {
    return const Text(
      "Breaking Bad",
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: MyColors.myGray,
      ),
    );
  }

  Widget myBody() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersSuccess) {
          characters = state.characters;
          return HomeBody(
            characters: characters,
            searchedCharacters: searchedCharacters,
            isSearching: _searchcontroloer.text.isEmpty ? false : true,
          );
        } else if (state is CharactersFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget noInternet() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/no_connection.svg",
            width: 100,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            "No Internet.....",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: isSearching ? myTextField() : noSearchTitle(),
        actions: isSearching ? clearButton() : searchButton(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return myBody();
          } else {
            return noInternet();
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
