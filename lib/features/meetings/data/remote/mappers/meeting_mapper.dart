import 'package:sync_center_mobile/features/companies/data/remote/mappers/companies_mapper.dart';

import '../../../domain/entities/meeting.dart';
import '../models/meeting/meeting_dto.dart';

extension MeetingDtoX on MeetingDto {
  Meeting toMeeting() => Meeting(
      title: title,
      id: id,
      startDate: DateTime.parse(startDate),
      statusName: statusName.statusName,
      requesterType: requesterType,
      company: company.toCompany(),);
}

extension MeetingListX on List<MeetingDto> {
  List<Meeting> toMeetings() => map((e) => e.toMeeting()).toList();
}
