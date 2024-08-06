import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/date.dart';
import '../../domain/entities/fcm_notification.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.notification,
    super.key,
  });

  final FcmNotification notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[100],
                child: const Center(
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 40,
                    color: SyncColors.darkBlue,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: SyncColors.darkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notification.description,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: SyncColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isToday(notification.date) ? "today" : DateFormat('dd/MM/yyyy').format(notification.date),
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: SyncColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
