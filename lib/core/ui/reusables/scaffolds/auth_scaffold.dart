import 'package:flutter/material.dart';

import '../../../utils/app_local.dart';
import '../../theme/colors.dart';
import '../buttons/default_back_button.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.child,
    required this.onBackPressed,
    required this.isLogin,
    required this.screenName,
  });

  final VoidCallback onBackPressed;
  final bool isLogin;
  final Widget child;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    Size diSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_image.jpg",
              height: diSize.height,
              fit: BoxFit.cover,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 64, 16, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Sync_logo_blur.png",
                        width: 200,
                        height: 150,
                      ),
                      Text(
                        getLang(context, screenName),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: SyncColors.background,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: child,
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 60,
            child: isLogin
                ? const SizedBox()
                : DefaultBackButton(
              onPressed: onBackPressed,
            ),
          ),
        ],
      ),
    );
  }
}
