import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/meetings_repository.dart';

@injectable
class DeleteMeetingUseCase {
  DeleteMeetingUseCase({
    required MeetingsRemoteRepository meetingsRemoteRepository,
  }) : _meetingsRemoteRepository = meetingsRemoteRepository;

  final MeetingsRemoteRepository _meetingsRemoteRepository;

  Future<Result<void>> call({required int meetingId}) async {
    final result =
        await _meetingsRemoteRepository.deleteMeeting(meetingId: meetingId);
    return result;
  }
}
