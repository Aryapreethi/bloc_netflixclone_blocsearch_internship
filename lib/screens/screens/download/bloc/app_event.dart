import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}
class DataloadedEvent extends DataEvent {
  @override

  List<Object?> get props => [];
  
}
