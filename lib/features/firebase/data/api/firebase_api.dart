import 'package:injectable/injectable.dart';

import '../../../../core/data/models/normal_response.dart';
import '../../../../core/data/models/pagination_response.dart';
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
      "/parents/fcm",
      body: {
        "fcmToken": fcmToken
      },
    );
  }

  Future<void> deleteFcmToken({required String fcmToken}) async {
    await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.delete,
      "/parents/fcm",
      body: {
        "fcmToken": fcmToken
      },
    );
  }

  Future<List<NotificationDto>> getNotifications(int page, int pageSize) async {
    final response = await _remoteManager.request<Map<String, dynamic>>(
      RequestMethod.get,
      "/parents/notifications?page=$page&pageSize=$pageSize",
    );
    final normalResponse = NormalResponse.fromJson(
        response.data ?? {},
            (data) => PaginationResponse.fromJson(data as Map<String, dynamic>,
                (data) => NotificationDto.fromJson(data as Map<String, dynamic>)));
    return normalResponse.data.items;
  }
}
