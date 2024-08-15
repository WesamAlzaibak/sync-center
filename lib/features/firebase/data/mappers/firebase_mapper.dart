import '../../domain/entities/fcm_notification.dart';
import '../models/notification_dto.dart';

extension NotificationDtoX on NotificationDto {
  FcmNotification toNotification() => FcmNotification(
        id: id,
        title: title,
        description: description,
        date: DateTime.parse(date),
        isSeen: isSeen,
      );
}

extension ProjectsListX on List<NotificationDto> {
  List<FcmNotification> toNotifications() =>
      map((e) => e.toNotification()).toList();
}
