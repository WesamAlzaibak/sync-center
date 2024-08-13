import 'package:bloc/bloc.dart';

import 'host_state.dart';

class HostCubit extends Cubit<HostState> {
  HostCubit() : super(const HostState(0));

  void toggleIndex(int index) async {
    emit(state.copy(index: index));
  }
}
