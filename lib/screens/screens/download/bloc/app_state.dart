import 'package:equatable/equatable.dart';
import 'package:net/model/model.dart';

abstract class UserdataState extends Equatable {}

class Dataloding extends UserdataState {
  @override
  List<Object?> get props => [];
}

class Dataloaded extends UserdataState {
  final List<Mylist> users;
  Dataloaded(this.users);
  @override
  List<Object?> get props => [users];
}

class Dataerror extends UserdataState {
  final String error;
  Dataerror(this.error);
  @override
  List<Object?> get props => [error];
}
