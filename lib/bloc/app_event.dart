import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable {}
class LoadUserEvent extends UserEvents {
  @override
  List<Object?> get props => [];
  
}
