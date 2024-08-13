import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/meetings/domain/entities/meeting.dart';
import 'package:sync_center_mobile/features/meetings/domain/enums/status_name_enum.dart';

import '../../../../../core/utils/result.dart';
import '../../../../meetings/domain/usecases/get_client_meetings_use_case.dart';
import 'calender_state.dart';

@injectable
class CalenderCubit extends Cubit<CalenderState> {
  final GetMeetingsUseCase _getMeetingsUseCase;

  CalenderCubit({
    required GetMeetingsUseCase getMeetingsUseCase,
  })  : _getMeetingsUseCase = getMeetingsUseCase,
        super(const CalenderInitialState());

  Future<void> fetchCalenderData() async {
    emit(const CalenderLoadingState());
    refreshCalenderData();
  }

  Future<void> refreshCalenderData() async {
    final results = await Future.wait([_getMeetingsUseCase.call()]);
    Result.evaluate(results).fold(
      (error) => emit(CalenderErrorState(
        exception: error,
      )),
      (data) {
        final allMeetings = data[0] as List<Meeting>;
        final meetings = allMeetings.where((meeting) => meeting.statusName == StatusNameEnum.accepted).toList();
        emit(
          CalenderSuccessState(
            meetings: meetings,
          ),
        );
      },
    );
  }
}
