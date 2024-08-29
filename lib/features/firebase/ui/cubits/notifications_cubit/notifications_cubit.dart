import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/result.dart';
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

  Future<void> fetchNotificationsData() async {
    emit(const NotificationsLoadingState());
    refreshNotificationsData();
  }

  Future<void> refreshNotificationsData() async {
    final results = await Future.wait([
      _getNotificationsUseCase.call()
    ]);
    Result.evaluate(results).fold(
          (error) => emit(NotificationsErrorState(exception: error,)),
          (data) {
        final notifications = data[0] as List<FcmNotification>;

          emit(
            NotificationsSuccessState(
                notifications: notifications,

            ),
          );

      },
    );
  }
}
