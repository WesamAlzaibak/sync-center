import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),),
        color: SyncColors.f3,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0,0,16,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "Welcome Mr.$userName",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
