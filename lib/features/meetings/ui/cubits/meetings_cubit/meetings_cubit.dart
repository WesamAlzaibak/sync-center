import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/meetings/domain/usecases/accept_reject_meeting_use_case.dart';
import 'package:sync_center_mobile/features/meetings/domain/usecases/create_meeting_use_case.dart';

import '../../../../../core/utils/result.dart';
import '../../../domain/entities/meeting.dart';
import '../../../domain/usecases/delete_meeting_use_case.dart';
import '../../../domain/usecases/get_client_meetings_use_case.dart';
import 'meetings_state.dart';

@injectable
class ClientMeetingsCubit extends Cubit<ClientMeetingsState> {
  final GetMeetingsUseCase _getMeetingsUseCase;
  final AcceptRejectMeetingUseCase _acceptRejectMeetingUseCase;
  final DeleteMeetingUseCase _deleteMeetingUseCase;
  final CreateMeetingUseCase _createMeetingUseCase;

  ClientMeetingsCubit({
    required GetMeetingsUseCase getMeetingsUseCase,
    required AcceptRejectMeetingUseCase acceptRejectMeetingUseCase,
    required DeleteMeetingUseCase deleteMeetingUseCase,
    required CreateMeetingUseCase createMeetingUseCase,
  })  : _getMeetingsUseCase = getMeetingsUseCase,
        _acceptRejectMeetingUseCase = acceptRejectMeetingUseCase,
        _deleteMeetingUseCase = deleteMeetingUseCase,
        _createMeetingUseCase = createMeetingUseCase,
        super(const ClientMeetingsInitialState());

  Future<void> fetchClientMeetingsData() async {
    emit(const ClientMeetingsLoadingState());
    refreshClientMeetingsData();
  }

  Future<void> refreshClientMeetingsData() async {
    final results = await Future.wait([_getMeetingsUseCase.call()]);
    Result.evaluate(results).fold(
      (error) => emit(ClientMeetingsErrorState(
        exception: error,
      )),
      (data) {
        final clientMeetings = data[0] as List<Meeting>;
        if (clientMeetings.isEmpty) {
          emit(const NoClientMeetingsState());
        } else {
          emit(
            ClientMeetingsSuccessState(
              meetings: clientMeetings,
            ),
          );
        }
      },
    );
  }

  Future<void> acceptRejectMeeting({
    required int meetingId,
    required int status,
  }) async {
    emit(
      const AcceptRejectMeetingLoadingState(),
    );
    final result = await _acceptRejectMeetingUseCase.call(
      meetingId: meetingId,
      status: status,
    );
    result.fold(
      (error) => emit(
        AcceptRejectMeetingErrorState(exception: error),
      ),
      (data) {
        emit(const AcceptRejectMeetingSuccessState());
      },
    );
  }

  Future<void> deleteMeeting({
    required int meetingId,
  }) async {
    emit(
      const AcceptRejectMeetingLoadingState(),
    );
    final result = await _deleteMeetingUseCase.call(meetingId: meetingId);
    result.fold(
      (error) => emit(
        AcceptRejectMeetingErrorState(exception: error),
      ),
      (data) {
        emit(const DeleteMeetingSuccessState());
      },
    );
  }

  Future<void> createMeeting({
    required String title,
    required String date,
  }) async {
    emit(
      const AcceptRejectMeetingLoadingState(),
    );
    print(date);
    final result = await _createMeetingUseCase.call(title: title, date: date);
    result.fold(
      (error) => emit(
        AcceptRejectMeetingErrorState(exception: error),
      ),
      (data) {
        emit(const CreateMeetingSuccessState());
      },
    );
  }
}
