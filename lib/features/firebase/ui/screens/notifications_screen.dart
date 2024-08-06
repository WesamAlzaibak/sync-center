import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../domain/entities/fcm_notification.dart';
import '../components/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const route = "/notifications_screen";

  @override
  Widget build(BuildContext context) {
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
        notification: [
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
          FcmNotification(
            id: 0,
            title: "Adding Tasks",
            description: "R-Link Has added some of tasks to Moushref Project",
            date: DateTime(2024, 5, 23),
          ),
        ],
      ),
    );
  }
}

class _NotificationsListView extends StatelessWidget {
  const _NotificationsListView({required this.notification});

  final List<FcmNotification> notification;

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
        return NotificationItem(notification: notification[index]);
      },
      itemCount: notification.length,
    );
  }
}
