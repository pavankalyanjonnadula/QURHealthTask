import 'package:flutter/material.dart';
import 'package:qur_health_assignment/bloc/bloc/api_bloc.dart';
import 'package:qur_health_assignment/models/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qur_health_assignment/models/results.dart';
import 'package:qur_health_assignment/widgets/chracters_details.dart';
import 'package:qur_health_assignment/widgets/image_widget.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  late ApiBloc apiBloc;
  CharactersResponse? charactersResponse;
  ScrollController controller = ScrollController();
  double scrollPosition = 0.0; // Store the scroll position.

  @override
  void initState() {
    super.initState();
    apiBloc = BlocProvider.of<ApiBloc>(context);
    apiBloc.add(InitialFetchCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHARACTERS"),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is InitialApiloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharactersLoadedState) {
            List<Results> combinedList = state.listOfCharacters.results ?? [];
            if (charactersResponse != null) {
              List<Results> oldList = charactersResponse?.results ?? [];
              List<Results> newList = state.listOfCharacters.results ?? [];
              combinedList = oldList + newList;
              state.listOfCharacters.results = combinedList;
              postFrameCallBack(oldList);
            }
            charactersResponse = state.listOfCharacters;
            return createListView(combinedList);
          }
          return Container();
        },
      ),
    );
  }

  void postFrameCallBack(List<Results> oldList) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double desiredPosition = (oldList.length * 70);
      controller.animateTo(
        desiredPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  shouldGetNewCharacters() {
    if (charactersResponse?.info?.next != null) {
      scrollPosition = controller.position.pixels;
      Future.delayed(const Duration(seconds: 1), () {
        apiBloc.add(
            FetchNewCharacters(apiUrl: charactersResponse?.info?.next ?? ""));
      });
    }
  }

  Widget createListView(List<Results> characterList) {
    return ListView.builder(
        itemCount: characterList.length + 1,
        controller: controller,
        itemBuilder: (context, index) {
          if (index == characterList.length) {
            shouldGetNewCharacters();
            return const SizedBox(
              height: 60,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return InkWell(
            onTap: () {
              navigateToDetailsPage(index, context, characterList);
            },
            child: Card(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                title: Text(characterList[index].name ?? ""),
                subtitle: Text(characterList[index].species ?? ""),
                trailing:
                    MyImageWidget(imageUrl: characterList[index].image ?? ""),
              ),
            ),
          );
        });
  }

  navigateToDetailsPage(
      int index, BuildContext context, List<Results> characterList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(
                  detailsOfCharacter: characterList[index],
                )));
  }
}
