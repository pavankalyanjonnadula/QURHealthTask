import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sorting_event.dart';
part 'sorting_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc() : super(SortingInitial()) {
    on<SortingEvent>((event, emit) {});
  }
}
