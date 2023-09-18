part of 'api_bloc.dart';

sealed class ApiEvent {}

class InitialFetchCharactersEvent extends ApiEvent {}

class FetchNewCharacters extends ApiEvent {
  late String apiUrl;
  bool? filtersEnable = false;
  FetchNewCharacters({required this.apiUrl, this.filtersEnable});
}
