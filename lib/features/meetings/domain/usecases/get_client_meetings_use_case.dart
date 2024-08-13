import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/meetings/data/remote/repositories/meetings_repository.dart';
import 'package:sync_center_mobile/features/meetings/domain/entities/meeting.dart';

import '../../../../core/utils/result.dart';

@injectable
class GetMeetingsUseCase {
  GetMeetingsUseCase({
    required MeetingsRemoteRepository meetingsRemoteRepository,
  }) : _meetingsRemoteRepository = meetingsRemoteRepository;

  final MeetingsRemoteRepository _meetingsRemoteRepository;

  Future<Result<List<Meeting>>> call() async {
    final result = await _meetingsRemoteRepository.getMeetings();
    return result;
  }
}
