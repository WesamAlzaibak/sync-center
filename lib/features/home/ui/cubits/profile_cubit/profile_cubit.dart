import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sync_center_mobile/features/companies/domain/entities/company.dart';
import 'package:sync_center_mobile/features/home/ui/cubits/profile_cubit/profile_state.dart';

import '../../../../../core/utils/result.dart';
import '../../../../auth/domain/models/profile.dart';
import '../../../../auth/domain/usecases/get_profile_use_case.dart';
import '../../../../auth/domain/usecases/logout_use_case.dart';
import '../../../../auth/domain/usecases/update_profile_image_use_case.dart';
import '../../../../companies/domain/usecases/get_company_use_case.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final GetCompanyUseCase _getCompanyUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateProfileImageUseCase _updateProfileImageUseCase;

  ProfileCubit({
    required GetProfileUseCase getProfileUseCase,
    required GetCompanyUseCase getCompanyUseCase,
    required LogoutUseCase logoutUseCase,
    required UpdateProfileImageUseCase updateProfileImageUseCase,
  })  : _getCompanyUseCase = getCompanyUseCase,
        _getProfileUseCase = getProfileUseCase,
        _logoutUseCase = logoutUseCase,
  _updateProfileImageUseCase = updateProfileImageUseCase,
        super(const ProfileInitialState());

  Company company = const Company(
      name: "",
      id: -1,
      email: "",
      phoneNumber: "",
      logo: "",
      projectsNumber: 0,
      employeesNumber: 0);
  Profile profile = Profile(
      id: 0, name: "", createDate: DateTime.now(), image: "", email: "");

  Future<void> fetchProfile() async {
    emit(const ProfileLoadingState());
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    final results = await Future.wait([
      _getCompanyUseCase.call(1),
      _getProfileUseCase.call(),
    ]);
    Result.evaluate(results).fold(
      (error) => emit(ProfileErrorState(exception: error)),
      (data) {
        profile = data[1] as Profile;
        company = data[0] as Company;
        emit(
          ProfileSuccessState(
            profile: profile,
            company: company,
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    emit(
      const LogoutLoadingState(),
    );
    final result = await _logoutUseCase.call();
    result.fold(
      (error) {
        emit(
          LogoutErrorState(
            exception: error,
          ),
        );
        emit(
          ProfileSuccessState(profile: profile, company: company),
        );
      },
      (data) => emit(
        const LogoutSuccessState(),
      ),
    );
  }

  Future<void> updateProfileImage(XFile file) async {
    emit(const UpdateProfileLoadingState());
    final result = await _updateProfileImageUseCase.call(file);
    result.fold(
          (error) {
        emit(UpdateProfileErrorState(exception: error));
        emit(ProfileSuccessState(profile: profile, company: company));
      },
          (data) => emit(
        const UpdateProfileSuccessState(),
      ),
    );
  }
}
