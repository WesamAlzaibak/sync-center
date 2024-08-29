import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sync_center_mobile/features/auth/ui/screens/login_screen.dart';

import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../components/logout_button_component.dart';
import '../components/profile_image_component.dart';
import '../components/profile_information_component.dart';
import '../cubits/profile_cubit/profile_cubit.dart';
import '../cubits/profile_cubit/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const route = "/Profile_screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void _updateChildImage(XFile? file) async {
    if (file != null) {
      context.read<ProfileCubit>().updateProfileImage(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previousState, state) {
            return previousState is! ProfileErrorState &&
                state is ProfileErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is ProfileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previousState, state) {
            return previousState is! LogoutLoadingState &&
                state is LogoutLoadingState;
          },
          listener: (context, state) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: SyncColors.darkBlue,
                    strokeCap: StrokeCap.round,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previousState, state) {
            return previousState is! LogoutSuccessState &&
                state is LogoutSuccessState;
          },
          listener: (context, state) {
            context.go(LoginScreen.route);
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previousState, state) {
            return previousState is! UpdateProfileLoadingState &&
                state is UpdateProfileLoadingState;
          },
          listener: (context, state) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: SyncColors.darkBlue,
                    strokeCap: StrokeCap.round,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previousState, state) {
            return previousState is! UpdateProfileSuccessState &&
                state is UpdateProfileSuccessState;
          },
          listener: (context, state) {
            _refreshIndicatorKey.currentState!.show();
            context.pop();
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          edgeOffset: 32,
          color: SyncColors.darkBlue,
          onRefresh: () => context.read<ProfileCubit>().fetchProfile(),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 56, 16, 24),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileImageComponent(
                                image: state.profile.image,
                                name: state.profile.name,
                                onChangePicClick: (file) =>
                                    _updateChildImage(file),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ProfileInformationComponent(
                                name: state.profile.name,
                                createDate: state.profile.createDate,
                                email: state.profile.email,
                                companyLogo: state.company.logo,
                                companyName: state.company.name,
                                companyEmail: state.company.email,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      LogoutButtonComponent(
                        onLogoutPressed: () =>
                            context.read<ProfileCubit>().logout(),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: SyncColors.darkBlue,
                    strokeCap: StrokeCap.round,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
