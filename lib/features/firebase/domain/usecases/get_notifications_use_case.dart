import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/repositories/firebase_repository.dart';
import '../entities/fcm_notification.dart';

@injectable
class GetNotificationsUseCase {
  GetNotificationsUseCase({
    required FirebaseRepository notificationsRepository,
  }) : _notificationsRepository = notificationsRepository;

  final FirebaseRepository _notificationsRepository;

  Future<Result<List<FcmNotification>>> call(int page, int pageSize) async {
    final result =
        await _notificationsRepository.getNotifications(page, pageSize);
    return result;
  }
}
