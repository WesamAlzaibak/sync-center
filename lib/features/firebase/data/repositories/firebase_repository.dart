import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/firebase/data/mappers/firebase_mapper.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/fcm_notification.dart';
import '../api/firebase_api.dart';

@injectable
class FirebaseRepository {
  final FirebaseApi _firebaseApi;

  FirebaseRepository({required FirebaseApi firebaseApi})
      : _firebaseApi = firebaseApi;

  Future<Result<void>> updateFcmToken({
    required String fcmToken,
  }) async {
    return await asyncRunCatching<void>(() async {
      await _firebaseApi.updateFcmToken(fcmToken: fcmToken);
    });
  }

  Future<Result<void>> deleteToken({
    required String fcmToken,
  }) async {
    return await asyncRunCatching<void>(() async {
      await _firebaseApi.deleteFcmToken(fcmToken: fcmToken);
    });
  }

  Future<Result<List<FcmNotification>>> getNotifications(int page, int pageSize) async {
    return await asyncRunCatching<List<FcmNotification>>(() async {
      final remoteNotifications = await _firebaseApi.getNotifications(page, pageSize);
      final notifications = remoteNotifications.map((e) => e.toNotification()).toList();
      return notifications;
    });
  }
}
