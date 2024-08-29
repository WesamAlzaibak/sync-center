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

  Future<Result<List<FcmNotification>>> getNotifications() async {
    return await asyncRunCatching<List<FcmNotification>>(() async {
      final notificationsDto = await _firebaseApi.getNotifications();
      final userProjects = notificationsDto.toNotifications();
      return userProjects;
    });
  }
}
