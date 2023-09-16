part of 'api_bloc.dart';

sealed class ApiEvent {}

class InitialFetchCharactersEvent extends ApiEvent {}

class FetchNewCharacters extends ApiEvent {
  late String apiUrl;
  FetchNewCharacters({required this.apiUrl});
}
