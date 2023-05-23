import 'package:flutter_bloc/flutter_bloc.dart';
import 'read_state.dart';

class ReadCubit extends Cubit<ReadState>{
  //ReadCubit(super.initialState);
  ReadCubit() : super(ReadState(isRead: true));

  void readToListen() => emit(ReadState(isRead: !(state.isRead)));
}
