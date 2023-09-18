import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qur_health_assignment/models/characters.dart';
import 'package:qur_health_assignment/repository/characters_repository.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    ApiRepository repository = ApiRepository();

    on<ApiEvent>((event, emit) async {
      if (event is InitialFetchCharactersEvent) {
        emit(InitialApiloading());
        try {
          CharactersResponse charactersResponse = await repository
              .fetchCharacters("https://rickandmortyapi.com/api/character");
          emit(CharactersLoadedState(listOfCharacters: charactersResponse));
        } catch (e) {
          // emit(ContactListErrorState(message: e.toString()));
        }
      } else if (event is FetchNewCharacters) {
        try {
          CharactersResponse charactersResponse =
              await repository.fetchCharacters(event.apiUrl);
          emit(CharactersLoadedState(
              listOfCharacters: charactersResponse,
              filtersEnable: event.filtersEnable));
        } catch (e) {
          // emit(ContactListErrorState(message: e.toString()));
        }
      }
    });
  }
}
