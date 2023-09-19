import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qur_health_assignment/bloc/api_bloc/sorting_bloc/sorting_bloc.dart';

// ignore: must_be_immutable
class SearchFilterCharacters extends StatefulWidget {
  SearchFilterCharacters({required this.function, this.filtersString, Key? key})
      : super(key: key);
  Function(String) function;
  String? filtersString;
  @override
  State<SearchFilterCharacters> createState() => _SearchFilterCharactersState();
}

class _SearchFilterCharactersState extends State<SearchFilterCharacters> {
  late SortingBloc sortingBloc;
  String selectedGender = '', selectedStatus = '', characterName = '';
  @override
  void initState() {
    super.initState();
    sortingBloc = BlocProvider.of<SortingBloc>(context);
    if (widget.filtersString != null) {
      List<String>? arrayStr = widget.filtersString?.split('&');
      for (String indexStr in arrayStr ?? []) {
        if (indexStr.contains('gender')) {
          selectedGender = indexStr.split('=').last;
        } else if (indexStr.contains('status')) {
          selectedStatus = indexStr.split('=').last;
        } else if (indexStr.contains('name')) {
          characterName = indexStr.split('=').last;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SortingBloc, SortingState>(builder: (context, state) {
        if (state is SortingInitial) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      characterName = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a character name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      "Character Status",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  charcterStatusAndGenderRow(
                      ['Alive', 'Death', 'Unknown'], 'status'),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      "Character Gender",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  charcterStatusAndGenderRow(
                      ['Male', 'Female', 'Unknown'], 'Gender'),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 30,
                      child: TextButton(
                        onPressed: () {
                          widget.function(createApiUrlExtension());
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            side: const BorderSide(width: 1),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        child: const Text(
                          'FILTER',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.filtersString != null,
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            side: const BorderSide(width: 1),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          setState(() {
                            selectedGender = '';
                            selectedStatus = '';
                            characterName = '';
                            widget.function('');

                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          'RESET FILTERS',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ]),
          );
        }
        return Container();
      }),
    );
  }

  String createApiUrlExtension() {
    String finalExtension = '';
    if (selectedGender != '') {
      finalExtension = '&gender=$selectedGender';
    }
    if (selectedStatus != '') {
      finalExtension = '$finalExtension&status=$selectedStatus';
    }
    if (characterName != '') {
      finalExtension = '$finalExtension&name=$characterName';
    }
    return finalExtension.substring(1);
  }

  Row charcterStatusAndGenderRow(List<String> array, String keyValvue) {
    return Row(
        children: array
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: (e == array[array.length - 1]) ? 0 : 15),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (keyValvue == 'Gender') {
                            selectedGender = e;
                          } else {
                            selectedStatus = e;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 1.0),
                          foregroundColor: (e == selectedGender &&
                                      keyValvue == 'Gender') ||
                                  (e == selectedStatus && keyValvue == 'status')
                              ? Colors.blue
                              : Colors.black),
                      child: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      )),
                ),
              ),
            )
            .toList());
  }
}
