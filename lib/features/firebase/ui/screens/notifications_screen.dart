import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../firebase/domain/entities/fcm_notification.dart';
import '../components/notification_item.dart';
import '../cubits/notifications_cubit/notifications_cubit.dart';
import '../cubits/notifications_cubit/notifications_state.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const route = "/notifications_screen";

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsState>(
        listenWhen: (previousState, state) {
      return previousState is! NotificationsErrorState &&
          state is NotificationsErrorState;
    }, listener: (BuildContext context, state) {
      if (state is NotificationsErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
      }
    }, child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: 100,
          leadingWidth: 80,
          centerTitle: true,
          leading: Row(
            children: [
              const SizedBox(width: 16),
              DefaultBackButton(
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: SyncColors.black,
            ),
          ),
        ),
        body: _NotificationsListView(
          notification:
              state is NotificationsSuccessState ? state.notifications : [],
          isLoading: state is NotificationsLoadingState,
        ),
      );
    }));
  }
}

class _NotificationsListView extends StatelessWidget {
  const _NotificationsListView(
      {required this.notification, required this.isLoading});

  final List<FcmNotification> notification;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: true,
      padding: const EdgeInsets.all(0),
      separatorBuilder: (context, index) => Container(
        color: SyncColors.grey,
        height: 1,
      ),
      itemBuilder: (context, index) {
        return NotificationItem(
            notification: notification[index], isLoading: isLoading);
      },
      itemCount: isLoading ? 5 : notification.length,
    );
  }
}
