import 'package:equatable/equatable.dart';
import 'package:net/model/model.dart';

abstract class UserState extends Equatable {}

class UserLodingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<Mylist> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class Error extends UserState {
  final String error;
  Error(this.error);
  @override
  List<Object?> get props => [error];
}
