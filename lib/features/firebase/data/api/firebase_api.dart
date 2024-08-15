import 'package:injectable/injectable.dart';

import '../../../../core/data/models/normal_response.dart';
import '../../../../core/data/remote/remote_manager.dart';
import '../models/notification_dto.dart';

@injectable
class FirebaseApi {
  final RemoteManager _remoteManager;

  FirebaseApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;

  Future<void> updateFcmToken({required String fcmToken}) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.post,
      "/user/device-token",
      body: {
        "device_token": fcmToken
      },
    );
  }
  Future<List<NotificationDto>> getNotifications() async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/user/notification",
    );
    final normalResponse = NormalResponse.fromJson(
      response.data ?? {},
          (data) => (data as List<dynamic>)
          .map((item) => NotificationDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return normalResponse.data;
  }

}
