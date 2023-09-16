import 'package:flutter/material.dart';
import 'package:qur_health_assignment/models/results.dart';

// ignore: must_be_immutable
class CharacterDetailsScreen extends StatefulWidget {
  Results detailsOfCharacter;

  CharacterDetailsScreen({required this.detailsOfCharacter, Key? key})
      : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAILS'),
      ),
      body: Column(
        children: [
          Image(
            image: NetworkImage(widget.detailsOfCharacter.image ?? ""),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.fill,
          ),
          details("Name", widget.detailsOfCharacter.name ?? ""),
          details("Status", widget.detailsOfCharacter.status ?? ""),
          details("Species", widget.detailsOfCharacter.species ?? ""),
          details("Location", widget.detailsOfCharacter.location?.name ?? ""),
          details(
              "Episodes", "${widget.detailsOfCharacter.episode?.length ?? 0}"),
          details("Gender", widget.detailsOfCharacter.gender ?? ""),
          details("Origin", widget.detailsOfCharacter.origin?.name ?? ""),
        ],
      ),
    );
  }

  Widget details(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                '-   ',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
