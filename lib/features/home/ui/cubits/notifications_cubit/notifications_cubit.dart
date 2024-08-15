import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../firebase/domain/entities/fcm_notification.dart';
import '../../../../firebase/domain/usecases/get_notifications_use_case.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;

  NotificationsCubit({
    required GetNotificationsUseCase getNotificationsUseCase,
  })  : _getNotificationsUseCase = getNotificationsUseCase,
        super(const NotificationsInitialState());

  Future<List<FcmNotification>> fetchNotifications() async {
    final result = await _getNotificationsUseCase.call();
    return result.fold(
      (error) => throw(error),
      (data) {
        return data;
      },
    );
  }
}
