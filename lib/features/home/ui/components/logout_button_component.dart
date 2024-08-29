import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class LogoutButtonComponent extends StatelessWidget {
  const LogoutButtonComponent({Key? key, required this.onLogoutPressed}) : super(key: key);

  final void Function() onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onLogoutPressed,
        child: Container(
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 16,
                spreadRadius: 0,
                offset: const Offset(0, 4),
                color: SyncColors.black.withOpacity(0.12),
              )
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 25,
                  color: SyncColors.darkBlue,
                ),
                Expanded(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: SyncColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis),
                    ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
