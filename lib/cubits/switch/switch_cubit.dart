import 'package:bloc/bloc.dart';
part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(flag: true));
  void toggleSwicth() {
    if (state.flag == false) {
      emit(SwitchState(flag: true));
    } else {
      emit(SwitchState(flag: false));
    }
  }
}
