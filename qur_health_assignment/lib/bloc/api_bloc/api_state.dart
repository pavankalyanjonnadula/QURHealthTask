// ignore_for_file: must_be_immutable

part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}

class InitialApiloading extends ApiState {}

class CharactersLoadedState extends ApiState {
  CharactersResponse listOfCharacters;
  bool? filtersEnable = false;
  CharactersLoadedState({required this.listOfCharacters, this.filtersEnable});
}

class ErrorState extends ApiState {
  String errorString;
  ErrorState({required this.errorString});
}
