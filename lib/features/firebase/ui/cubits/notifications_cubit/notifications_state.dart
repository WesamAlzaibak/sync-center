import 'package:equatable/equatable.dart';

import '../../../domain/entities/fcm_notification.dart';


class NotificationsState extends Equatable {
  const NotificationsState();

  NotificationsState copy() => const NotificationsState();

  @override
  List<Object?> get props => [];
}

class NotificationsInitialState extends NotificationsState {
  const NotificationsInitialState();

  @override
  NotificationsInitialState copy() => const NotificationsInitialState();

  @override
  List<Object> get props => [];
}

class NotificationsLoadingState extends NotificationsState {
  const NotificationsLoadingState();

  @override
  NotificationsLoadingState copy() =>
      const NotificationsLoadingState();

  @override
  List<Object> get props => [];
}

class NotificationsErrorState extends NotificationsState {
  final Exception exception;

  @override
  const NotificationsErrorState({required this.exception});

  @override
  NotificationsErrorState copy({Exception? exception}) =>
      NotificationsErrorState(
        exception: exception ?? this.exception,
      );

  @override
  List<Object> get props => [exception];
}

class NotificationsSuccessState extends NotificationsState {
  final List<FcmNotification> notifications;

  const NotificationsSuccessState(
      {required this.notifications});

  @override
  NotificationsSuccessState copy({
    List<FcmNotification>? notifications,
  }) =>
      NotificationsSuccessState(
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object> get props => [notifications];
}
