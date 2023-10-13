import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/bloc/app_event.dart';
import 'package:net/bloc/app_state.dart';
import 'package:net/provider/api.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final Api _api;

  UserBloc(this._api) : super(UserLodingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLodingState());
      try {
        final users = await _api.getlistnowplaying();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
}
}