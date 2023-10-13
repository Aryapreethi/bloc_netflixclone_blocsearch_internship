import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/download/bloc/app_event.dart';
import 'package:net/screens/screens/download/bloc/app_state.dart';

class DataBloc extends Bloc<DataEvent,UserdataState> {
  final HomeaApi _homeaapi;
  DataBloc(this._homeaapi,) : super(Dataloding()){
    on<DataloadedEvent>(((event, emit) async{
      try {
        final users=await _homeaapi.getcomingsoon();
        emit(Dataloaded(users));
        
      } catch (e) {
        emit(Dataerror(e.toString()));
      }
    }));

    

  }
  
  
}