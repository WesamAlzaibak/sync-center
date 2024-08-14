import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/remote/repositories/meetings_repository.dart';

@injectable
class CreateMeetingUseCase {
  CreateMeetingUseCase({
    required MeetingsRemoteRepository meetingsRemoteRepository,
  }) : _meetingsRemoteRepository = meetingsRemoteRepository;

  final MeetingsRemoteRepository _meetingsRemoteRepository;

  Future<Result<void>> call({required String title,required String date}) async {
    final result = await _meetingsRemoteRepository.createMeeting(
        title: title, date: date);
    return result;
  }
}