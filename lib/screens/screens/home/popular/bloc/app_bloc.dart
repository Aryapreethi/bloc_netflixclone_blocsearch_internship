import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/home/popular/bloc/app_event.dart';
import 'package:net/screens/screens/home/popular/bloc/app_state.dart';

class MovieBloc extends Bloc<MovieLoadevent, MovieloadState> {
  final HomeaApi _homeaApi;
  MovieBloc(this._homeaApi) : super(MovieloadingState()) {
    on<MovieloadingEvent>(
      (event, emit) async {
        emit(MovieloadingState());
        try {
          final users = await _homeaApi.popularlist();
          emit(MovieloadedState(users));
        } catch (e) {
          emit(MovierrorState(e.toString()));
        }
      },
    );
  }
}
