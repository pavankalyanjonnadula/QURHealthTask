import 'package:flutter/material.dart';
import 'package:qur_health_assignment/bloc/api_bloc/api_bloc.dart';
import 'package:qur_health_assignment/widgets/list_of_characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ApiBloc(),
        child: const CharactersList(),
      ),
    );
  }
}
