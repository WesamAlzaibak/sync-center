import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/auth/ui/screens/login_screen.dart';
import 'package:sync_center_mobile/features/home/ui/cubits/home_cubit/home_cubit.dart';
import 'package:sync_center_mobile/features/home/ui/screens/home_screen.dart';
import 'package:sync_center_mobile/features/meetings/ui/cubits/meetings_cubit/meetings_cubit.dart';
import 'package:sync_center_mobile/features/meetings/ui/screens/meeetings_screen.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/project_details/project_details_cubit.dart';
import 'package:sync_center_mobile/features/projects/ui/cubits/tasks/tasks_cubit.dart';
import 'package:sync_center_mobile/features/projects/ui/screens/project_details_screen.dart';

import '../../../di/di.dart';
import '../../../features/auth/ui/blocs/forget_password/forget_password_cubit.dart';
import '../../../features/auth/ui/blocs/login/login_cubit.dart';
import '../../../features/auth/ui/blocs/reset_password/reset_password_cubit.dart';
import '../../../features/auth/ui/blocs/reset_password_verification/reset_password_verification_cubit.dart';
import '../../../features/auth/ui/screens/forget_password_screen.dart';
import '../../../features/auth/ui/screens/reset_password_screen.dart';
import '../../../features/auth/ui/screens/reset_password_verification_screen.dart';
import '../../../features/companies/ui/cubits/company_details/company_details_cubit.dart';
import '../../../features/companies/ui/screens/company_details_screen.dart';
import '../../../features/firebase/ui/cubits/notifications_cubit/notifications_cubit.dart';
import '../../../features/firebase/ui/screens/notifications_screen.dart';
import '../../../features/home/ui/cubits/host_cubit/host_cubit.dart';
import '../../../features/home/ui/screens/host screen.dart';
import '../../../features/projects/ui/cubits/project_files/project_files_cubit.dart';
import '../../../features/projects/ui/screens/project_files_screen.dart';
import '../../../features/projects/ui/screens/tasks_screen.dart';

final router = GoRouter(initialLocation: LoginScreen.route, routes: [
  GoRoute(
    path: LoginScreen.route,
    builder: (context, state) => BlocProvider<LoginCubit>(
      create: (BuildContext context) => getIt.get<LoginCubit>(),
      child: const LoginScreen(),
    ),
  ),
  GoRoute(
    path: ResetPasswordVerificationScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      return BlocProvider<ResetPasswordVerificationCubit>(
        create: (BuildContext context) =>
            getIt.get<ResetPasswordVerificationCubit>(),
        child: ResetPasswordVerificationScreen(
          email: extra?["email"] ?? "",
        ),
      );
    },
  ),
  GoRoute(
    path: ResetPasswordScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      return BlocProvider<ResetPasswordCubit>(
        create: (BuildContext context) => getIt.get<ResetPasswordCubit>(),
        child: ResetPasswordScreen(
          email: extra?["email"] ?? "",
          code: extra?["code"] ?? "",
        ),
      );
    },
  ),
  GoRoute(
    path: ForgetPasswordScreen.route,
    builder: (context, state) => BlocProvider(
        create: (BuildContext context) => getIt.get<ForgetPasswordCubit>(),
        child: const ForgetPasswordScreen()),
  ),
  GoRoute(
    path: ProjectDetailsScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final projectId = extra?["projectId"] ?? 0;
      return BlocProvider<ProjectDetailsCubit>(
        create: (BuildContext context) {
          final projectDetailsCubit = getIt.get<ProjectDetailsCubit>()
            ..fetchProjectDetails(projectId: projectId);
          return projectDetailsCubit;
        },
        child: ProjectDetailsScreen(projectId: projectId),
      );
    },
  ),
  GoRoute(
    path: HomeScreen.route,
    builder: (context, state) {
      return BlocProvider<HomeCubit>(
        create: (BuildContext context) {
          final homeCubit = getIt.get<HomeCubit>()..init();
          return homeCubit;
        },
        child: HomeScreen(),
      );
    },
  ),
  GoRoute(
    path: CompanyDetailsScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final companyId = extra?["companyId"] ?? 0;
      return BlocProvider<CompanyDetailsCubit>(
        create: (BuildContext context) {
          final companyDetailsCubit = getIt.get<CompanyDetailsCubit>()
            ..fetchCompanyDetailsData(companyId);
          return companyDetailsCubit;
        },
        child: CompanyDetailsScreen(companyId: companyId),
      );
    },
  ),
  GoRoute(
    path: NotificationsScreen.route,
    builder: (context, state) {
      return BlocProvider<NotificationsCubit>(
        create: (BuildContext context) {
          final notificationCubit = getIt.get<NotificationsCubit>()
            ..fetchNotifications();
          return notificationCubit;
        },
        child: const NotificationsScreen(),
      );
    },
  ),
  GoRoute(
    path: TasksScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final projectId = extra?["projectId"] ?? -1;
      final projectName = extra?["projectName"] ?? "Moushref";
      return BlocProvider<ProjectTasksCubit>(
        create: (BuildContext context) => getIt.get<ProjectTasksCubit>()
          ..fetchProjectTasks(projectId: projectId),
        child: TasksScreen(
          projectName: projectName,
          projectId: projectId,
        ),
      );
    },
  ),
  GoRoute(
    path: ProjectFilesScreen.route,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final projectId = extra?["projectId"] ?? -1;
      final projectName = extra?["projectName"] ?? "Moushref";
      return BlocProvider<ProjectFilesCubit>(
        create: (BuildContext context) =>
            getIt.get<ProjectFilesCubit>()..fetchProjectFilesData(projectId),
        child: ProjectFilesScreen(
          projectName: projectName,
          projectId: projectId,
        ),
      );
    },
  ),
  GoRoute(
    path: HostScreen.route,
    builder: (context, state) => BlocProvider(
      create: (context) => HostCubit(),
      child: const HostScreen(),
    ),
  ),
  GoRoute(
    path: ClientMeetingsScreen.route,
    builder: (context, state) {
      return BlocProvider<ClientMeetingsCubit>(
        create: (BuildContext context) =>
        getIt.get<ClientMeetingsCubit>()..fetchClientMeetingsData(),
        child: ClientMeetingsScreen(),
      );
    },
  ),
]);
