import '../../../domain/entities/meeting.dart';
import '../models/meeting/meeting_dto.dart';

extension MeetingDtoX on MeetingDto {
  Meeting toMeeting() => Meeting(
        title: title,
        id: id,
        startDate: DateTime.parse(startDate),
        description: description,
        endDate: DateTime.parse(endDate),
      );
}

extension MeetingListX on List<MeetingDto> {
  List<Meeting> toMeetings() => map((e) => e.toMeeting()).toList();
}
