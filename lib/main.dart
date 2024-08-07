import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sync_center_mobile/features/companies/ui/screens/company_details_screen.dart';
import 'package:sync_center_mobile/features/home/ui/screens/home_screen.dart';
import 'core/ui/navigation/navigation.dart';
import 'core/ui/theme/colors.dart';
import 'core/utils/app_local.dart';
import 'di/di.dart';
import 'features/auth/data/local/repositories/auth_local_repository.dart';
import 'features/auth/ui/screens/login_screen.dart';
import 'features/firebase/firebase.dart';
import 'features/firebase/ui/screens/notifications_screen.dart';
import 'features/projects/ui/screens/project_details_screen.dart';
import 'features/projects/ui/screens/project_files_screen.dart';
import 'features/projects/ui/screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final authLocalRepository = getIt.get<AuthLocalRepository>();
  final isLoggedIn = authLocalRepository.isLoggedIn();
  String initialRoute;
  if (isLoggedIn) {
    initialRoute = HomeScreen.route;
  } else {
    initialRoute = ProjectFilesScreen.route;
  }
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: SyncColors.f1,
    ),
  );
  initFirebaseApp();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en")],
      title: 'Sync Center',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Expo',
        colorScheme: ColorScheme.fromSeed(seedColor: SyncColors.darkBlue)
            .copyWith(error: SyncColors.red),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    router.go(widget.initialRoute);
  }
}
