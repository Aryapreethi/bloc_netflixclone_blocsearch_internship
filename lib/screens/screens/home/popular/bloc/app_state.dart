import 'package:equatable/equatable.dart';
import 'package:net/model/model.dart';

abstract class MovieloadState extends Equatable {}

class MovieloadingState extends MovieloadState {
  @override
  List<Object?> get props => [];
}

class MovieloadedState extends MovieloadState {
  final List<Mylist> data;
  MovieloadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class MovierrorState extends MovieloadState {
  final String error;
  MovierrorState(this.error);
  @override
  List<Object?> get props => [error];
}
