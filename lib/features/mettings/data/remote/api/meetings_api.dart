import 'package:injectable/injectable.dart';

import '../../../../../core/data/models/normal_response.dart';
import '../../../../../core/data/remote/remote_manager.dart';
import '../models/meeting/meeting_dto.dart';

@injectable
class MeetingsApi {
  final RemoteManager _remoteManager;

  MeetingsApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<List<MeetingDto>> getMeetings() async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/meetings",
    );
    final normalResponse = NormalResponse.fromJson(
      response.data ?? {},
          (data) => (data as List<dynamic>)
          .map((item) => MeetingDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return normalResponse.data;
  }
}
