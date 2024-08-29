import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/meetings/data/remote/mappers/meeting_mapper.dart';
import 'package:sync_center_mobile/features/meetings/data/remote/models/create_meeting/create_meeting_dto.dart';
import 'package:sync_center_mobile/features/meetings/domain/entities/meeting.dart';

import '../../../../../core/utils/result.dart';
import '../api/meetings_api.dart';

@injectable
class MeetingsRemoteRepository {
  final MeetingsApi _meetingsApi;

  MeetingsRemoteRepository({required MeetingsApi meetingsApi})
      : _meetingsApi = meetingsApi;

  Future<Result<List<Meeting>>> getMeetings() async {
    return await asyncRunCatching<List<Meeting>>(() async {
      final meetingDto = await _meetingsApi.getMeetings();
      final projects = meetingDto.toMeetings();
      return projects;
    });
  }

  Future<Result<void>> acceptRejectMeeting({
    required int meetingId,
    required int status,
  }) async {
    return await asyncRunCatching<void>(
          () async {
        return await _meetingsApi.acceptRejectMeeting(
            meetingId: meetingId,status: status);
      },
    );
  }

  Future<Result<void>> deleteMeeting({
    required int meetingId,
  }) async {
    return await asyncRunCatching<void>(
          () async {
        return await _meetingsApi.deleteMeeting(
            meetingId: meetingId);
      },
    );
  }

  Future<Result<void>> createMeeting({
    required String title,
    required String date,
  }) async {
    return await asyncRunCatching<void>(
          () async {
            final createMeetingDto = CreateMeetingDto(
              title: title,
              date: date,
              companyId: 1
            );
        return await _meetingsApi.createMeeting(
            createMeetingDto: createMeetingDto);
      },
    );
  }
}
