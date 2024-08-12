import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/mettings/data/remote/mappers/meeting_mapper.dart';
import 'package:sync_center_mobile/features/mettings/domain/entities/meeting.dart';

import '../../../../../core/utils/result.dart';
import '../api/meetings_api.dart';

@injectable
class MeetingsRemoteRepository {
  final MeetingsApi _meetingsApi;

  MeetingsRemoteRepository({required MeetingsApi meetingsApi}) : _meetingsApi = meetingsApi;

  Future<Result<List<Meeting>>> getMeetings() async {
    return await asyncRunCatching<List<Meeting>>(() async {
      final meetingDto = await _meetingsApi.getMeetings();
      final projects = meetingDto.toMeetings();
      return projects;
    });
  }
}
