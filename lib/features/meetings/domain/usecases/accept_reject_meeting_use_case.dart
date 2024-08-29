import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/meetings_repository.dart';

@injectable
class AcceptRejectMeetingUseCase {
  AcceptRejectMeetingUseCase({
    required MeetingsRemoteRepository meetingsRemoteRepository,
  }) : _meetingsRemoteRepository = meetingsRemoteRepository;

  final MeetingsRemoteRepository _meetingsRemoteRepository;

  Future<Result<void>> call({required int meetingId,required int status}) async {
    final result = await _meetingsRemoteRepository.acceptRejectMeeting(
        meetingId: meetingId, status: status);
    return result;
  }
}
