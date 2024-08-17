// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sync_center_mobile/core/data/remote/remote_manager.dart' as _i7;
import 'package:sync_center_mobile/di/di.dart' as _i48;
import 'package:sync_center_mobile/features/auth/data/local/datasources/auth_preferences.dart'
    as _i13;
import 'package:sync_center_mobile/features/auth/data/local/datasources/user_preferences.dart'
    as _i9;
import 'package:sync_center_mobile/features/auth/data/local/repositories/auth_local_repository.dart'
    as _i31;
import 'package:sync_center_mobile/features/auth/data/local/repositories/user_local_repository.dart'
    as _i28;
import 'package:sync_center_mobile/features/auth/data/remote/apis/auth_api.dart'
    as _i12;
import 'package:sync_center_mobile/features/auth/data/remote/repositories/auth_remote_repository.dart'
    as _i14;
import 'package:sync_center_mobile/features/auth/domain/usecases/login_use_case.dart'
    as _i36;
import 'package:sync_center_mobile/features/auth/domain/usecases/request_reset_password_use_case.dart'
    as _i23;
import 'package:sync_center_mobile/features/auth/domain/usecases/resend_reset_password_code_use_case.dart'
    as _i24;
import 'package:sync_center_mobile/features/auth/domain/usecases/reset_password_use_case.dart'
    as _i26;
import 'package:sync_center_mobile/features/auth/domain/usecases/verify_reset_password_code_use_case.dart'
    as _i29;
import 'package:sync_center_mobile/features/auth/ui/blocs/forget_password/forget_password_cubit.dart'
    as _i32;
import 'package:sync_center_mobile/features/auth/ui/blocs/login/login_cubit.dart'
    as _i46;
import 'package:sync_center_mobile/features/auth/ui/blocs/reset_password/reset_password_cubit.dart'
    as _i39;
import 'package:sync_center_mobile/features/auth/ui/blocs/reset_password_verification/reset_password_verification_cubit.dart'
    as _i40;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../features/auth/domain/usecases/get_profile_use_case.dart' as _i57;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i58;
import '../features/auth/domain/usecases/update_profile_image_use_case.dart'
    as _i59;
import '../features/companies/data/remote/apis/company_api.dart' as _i33;
import '../features/companies/data/remote/repositories/company_remote_repository.dart'
    as _i34;
import '../features/companies/domain/usecases/get_company_use_case.dart'
    as _i35;
import '../features/companies/ui/cubits/company_details/company_details_cubit.dart'
    as _i36;
import '../features/files/data/remote/apis/file_api.dart' as _i41;
import '../features/files/data/remote/repositories/file_repository.dart'
    as _i42;
import '../features/files/domain/usecases/get_project_files_use_case.dart'
    as _i47;
import '../features/files/domain/usecases/upload_project_file_use_case.dart'
    as _i49;
import '../features/firebase/data/api/firebase_api.dart' as _i37;
import '../features/firebase/data/repositories/firebase_repository.dart'
    as _i38;
import '../features/firebase/domain/usecases/get_notifications_use_case.dart'
    as _i39;

import '../features/firebase/ui/cubits/notifications_cubit/notifications_cubit.dart'
    as _i40;
import '../features/home/ui/cubits/calender_cubit/calender_cubit.dart' as _i53;
import '../features/home/ui/cubits/home_cubit/home_cubit.dart' as _i31;
import '../features/home/ui/cubits/profile_cubit/profile_cubit.dart' as _i60;
import '../features/meetings/data/remote/api/meetings_api.dart' as _i50;
import '../features/meetings/data/remote/repositories/meetings_repository.dart'
    as _i51;
import '../features/meetings/domain/usecases/accept_reject_meeting_use_case.dart'
    as _i54;
import '../features/meetings/domain/usecases/create_meeting_use_case.dart'
    as _i56;
import '../features/meetings/domain/usecases/delete_meeting_use_case.dart'
    as _i55;
import '../features/meetings/domain/usecases/get_client_meetings_use_case.dart'
    as _i52;
import '../features/meetings/ui/cubits/meetings_cubit/meetings_cubit.dart'
    as _i57;
import '../features/projects/data/remote/apis/projects_api.dart' as _i27;
import '../features/projects/data/remote/repositories/projects_remote_repository.dart'
    as _i28;
import '../features/projects/domain/usecases/get_project_details_use_case.dart'
    as _i29;
import '../features/projects/domain/usecases/get_projects_use_case.dart'
    as _i30;
import '../features/projects/ui/cubits/project_details/project_details_cubit.dart'
    as _i32;
import '../features/projects/ui/cubits/project_files/project_files_cubit.dart'
    as _i50;
import '../features/projects/ui/cubits/tasks/tasks_cubit.dart' as _i46;
import '../features/tasks/data/remote/api/tasks_api.dart' as _i43;
import '../features/tasks/data/remote/repositories/tasks_repository.dart'
    as _i44;
import '../features/tasks/domain/usecases/get_project_tasks_use_case.dart'
    as _i45;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i3.Dio>(() => dioModule.dio);
    gh.factory<_i7.RemoteManager>(() => _i7.RemoteManager(dio: gh<_i3.Dio>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => sharedPreferencesModule.pref,
      preResolve: true,
    );
    gh.factory<_i9.UserPreferences>(() =>
        _i9.UserPreferences(sharedPreferences: gh<_i8.SharedPreferences>()));
    gh.factory<_i12.AuthApi>(
        () => _i12.AuthApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i13.AuthPreferences>(() =>
        _i13.AuthPreferences(sharedPreferences: gh<_i8.SharedPreferences>()));
    gh.factory<_i14.AuthRemoteRepository>(
        () => _i14.AuthRemoteRepository(authApi: gh<_i12.AuthApi>()));
    gh.factory<_i23.RequestResetPasswordUseCase>(() =>
        _i23.RequestResetPasswordUseCase(
            authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i24.ResendResetPasswordCodeUseCase>(() =>
        _i24.ResendResetPasswordCodeUseCase(
            authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i28.UserLocalRepository>(() =>
        _i28.UserLocalRepository(userPreferences: gh<_i9.UserPreferences>()));
    gh.factory<_i29.VerifyResetPasswordCodeUseCase>(() =>
        _i29.VerifyResetPasswordCodeUseCase(
            authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i31.AuthLocalRepository>(() =>
        _i31.AuthLocalRepository(authPreferences: gh<_i13.AuthPreferences>()));
    gh.factory<_i32.ForgetPasswordCubit>(() => _i32.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i23.RequestResetPasswordUseCase>()));
    gh.factory<_i36.LoginUseCase>(() => _i36.LoginUseCase(
          authRemoteRepository: gh<_i14.AuthRemoteRepository>(),
          authLocalRepository: gh<_i31.AuthLocalRepository>(),
          userLocalRepository: gh<_i28.UserLocalRepository>(),
          firebaseRepository: gh<_i38.FirebaseRepository>(),
        ));
    gh.factory<_i39.ResetPasswordCubit>(() => _i39.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i26.ResetPasswordUseCase>()));
    gh.factory<_i40.ResetPasswordVerificationCubit>(
        () => _i40.ResetPasswordVerificationCubit(
              verifyResetPasswordCodeUseCase:
                  gh<_i29.VerifyResetPasswordCodeUseCase>(),
              resendResetPasswordCodeUseCase:
                  gh<_i24.ResendResetPasswordCodeUseCase>(),
            ));
    gh.factory<_i46.LoginCubit>(
        () => _i46.LoginCubit(loginUseCase: gh<_i36.LoginUseCase>()));
    gh.factory<_i26.ResetPasswordUseCase>(() => _i26.ResetPasswordUseCase(
        authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i27.ProjectApi>(
        () => _i27.ProjectApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i28.ProjectRemoteRepository>(
        () => _i28.ProjectRemoteRepository(projectApi: gh<_i27.ProjectApi>()));
    gh.factory<_i29.GetProjectDetailsUseCase>(() =>
        _i29.GetProjectDetailsUseCase(
            projectRemoteRepository: gh<_i28.ProjectRemoteRepository>()));
    gh.factory<_i30.GetUserProjectsUseCase>(() => _i30.GetUserProjectsUseCase(
        projectRemoteRepository: gh<_i28.ProjectRemoteRepository>()));
    gh.factory<_i31.HomeCubit>(() => _i31.HomeCubit(
          getMyProjectsUseCase: gh<_i30.GetUserProjectsUseCase>(),
          userLocalRepository: gh<_i28.UserLocalRepository>(),
        ));
    gh.factory<_i32.ProjectDetailsCubit>(() => _i32.ProjectDetailsCubit(
        getProjectDetailsUseCase: gh<_i29.GetProjectDetailsUseCase>(),
        getCompanyUseCase: gh<_i35.GetCompanyUseCase>()));
    gh.factory<_i33.CompanyApi>(
        () => _i33.CompanyApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i34.CompanyRemoteRepository>(
        () => _i34.CompanyRemoteRepository(companyApi: gh<_i33.CompanyApi>()));
    gh.factory<_i35.GetCompanyUseCase>(() => _i35.GetCompanyUseCase(
        companyRemoteRepository: gh<_i34.CompanyRemoteRepository>()));
    gh.factory<_i36.CompanyDetailsCubit>(() => _i36.CompanyDetailsCubit(
          getCompanyUseCase: gh<_i35.GetCompanyUseCase>(),
          getUserProjectsUseCase: gh<_i30.GetUserProjectsUseCase>(),
        ));
    gh.factory<_i37.FirebaseApi>(
        () => _i37.FirebaseApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i38.FirebaseRepository>(
        () => _i38.FirebaseRepository(firebaseApi: gh<_i37.FirebaseApi>()));
    gh.factory<_i39.GetNotificationsUseCase>(() => _i39.GetNotificationsUseCase(
        notificationsRepository: gh<_i38.FirebaseRepository>()));
    gh.factory<_i40.NotificationsCubit>(() => _i40.NotificationsCubit(
        getNotificationsUseCase: gh<_i39.GetNotificationsUseCase>()));
    gh.factory<_i41.FileApi>(
        () => _i41.FileApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i42.FileRemoteRepository>(
        () => _i42.FileRemoteRepository(fileApi: gh<_i41.FileApi>()));
    gh.factory<_i43.TasksApi>(
        () => _i43.TasksApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i44.TasksRemoteRepository>(
        () => _i44.TasksRemoteRepository(tasksApi: gh<_i43.TasksApi>()));
    gh.factory<_i45.GetProjectTasksUseCase>(() => _i45.GetProjectTasksUseCase(
        tasksRemoteRepository: gh<_i44.TasksRemoteRepository>()));
    gh.factory<_i46.ProjectTasksCubit>(() => _i46.ProjectTasksCubit(
        getProjectTasksUseCase: gh<_i45.GetProjectTasksUseCase>()));
    gh.factory<_i47.GetProjectFilesUseCase>(() => _i47.GetProjectFilesUseCase(
        fileRemoteRepository: gh<_i42.FileRemoteRepository>()));
    gh.factory<_i49.UploadProjectFileUseCase>(() =>
        _i49.UploadProjectFileUseCase(
            fileRemoteRepository: gh<_i42.FileRemoteRepository>()));
    gh.factory<_i50.ProjectFilesCubit>(() => _i50.ProjectFilesCubit(
          getProjectFilesUseCase: gh<_i47.GetProjectFilesUseCase>(),
          uploadProjectFileUseCase: gh<_i49.UploadProjectFileUseCase>(),
        ));
    gh.factory<_i50.MeetingsApi>(
        () => _i50.MeetingsApi(remoteManager: gh<_i7.RemoteManager>()));
    gh.factory<_i51.MeetingsRemoteRepository>(() =>
        _i51.MeetingsRemoteRepository(meetingsApi: gh<_i50.MeetingsApi>()));
    gh.factory<_i52.GetMeetingsUseCase>(() => _i52.GetMeetingsUseCase(
        meetingsRemoteRepository: gh<_i51.MeetingsRemoteRepository>()));
    gh.factory<_i53.CalenderCubit>(() => _i53.CalenderCubit(
          getMeetingsUseCase: gh<_i52.GetMeetingsUseCase>(),
        ));
    gh.factory<_i54.AcceptRejectMeetingUseCase>(() =>
        _i54.AcceptRejectMeetingUseCase(
            meetingsRemoteRepository: gh<_i51.MeetingsRemoteRepository>()));
    gh.factory<_i55.DeleteMeetingUseCase>(() => _i55.DeleteMeetingUseCase(
        meetingsRemoteRepository: gh<_i51.MeetingsRemoteRepository>()));
    gh.factory<_i56.CreateMeetingUseCase>(() => _i56.CreateMeetingUseCase(
        meetingsRemoteRepository: gh<_i51.MeetingsRemoteRepository>()));
    gh.factory<_i57.ClientMeetingsCubit>(() => _i57.ClientMeetingsCubit(
          getMeetingsUseCase: gh<_i52.GetMeetingsUseCase>(),
          acceptRejectMeetingUseCase: gh<_i54.AcceptRejectMeetingUseCase>(),
          deleteMeetingUseCase: gh<_i55.DeleteMeetingUseCase>(),
          createMeetingUseCase: gh<_i56.CreateMeetingUseCase>(),
        ));
    gh.factory<_i57.GetProfileUseCase>(() => _i57.GetProfileUseCase(
        authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i58.LogoutUseCase>(() => _i58.LogoutUseCase(
        authLocalRepository: gh<_i31.AuthLocalRepository>(),
      authRemoteRepository: gh<_i14.AuthRemoteRepository>(),
    ));
    gh.factory<_i59.UpdateProfileImageUseCase>(() =>
        _i59.UpdateProfileImageUseCase(
            authRemoteRepository: gh<_i14.AuthRemoteRepository>()));
    gh.factory<_i60.ProfileCubit>(() => _i60.ProfileCubit(
          getProfileUseCase: gh<_i57.GetProfileUseCase>(),
          getCompanyUseCase: gh<_i35.GetCompanyUseCase>(),
          logoutUseCase: gh<_i58.LogoutUseCase>(),
          updateProfileImageUseCase: gh<_i59.UpdateProfileImageUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i48.DioModule {}

class _$SharedPreferencesModule extends _i48.SharedPreferencesModule {}
