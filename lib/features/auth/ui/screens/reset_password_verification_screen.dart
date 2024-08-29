import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/auth/ui/screens/reset_password_screen.dart';

import '../../../../core/ui/reusables/buttons/default_button.dart';
import '../../../../core/ui/reusables/scaffolds/auth_scaffold.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/reusables/textfields/one_time_password_text_field.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/app_local.dart';
import '../blocs/reset_password_verification/reset_password_verification_cubit.dart';
import '../blocs/reset_password_verification/reset_password_verification_state.dart';

class ResetPasswordVerificationScreen extends StatefulWidget {
  static const route = "/reset_password_verification_screen";

  final String email;

  const ResetPasswordVerificationScreen({super.key, required this.email});

  @override
  State<ResetPasswordVerificationScreen> createState() =>
      _ResetPasswordVerificationScreenState();
}

class _ResetPasswordVerificationScreenState
    extends State<ResetPasswordVerificationScreen> {
  final pinTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onVerifyResetPasswordCodePressed() {
    final code = pinTextEditingController.text;
    final resetPasswordVerificationCubit =
        context.read<ResetPasswordVerificationCubit>();
    resetPasswordVerificationCubit.verify(
        code: code, email: widget.email);
  }

  void onResendPressed() {
    final resetPasswordVerificationCubit =
        context.read<ResetPasswordVerificationCubit>();
    resetPasswordVerificationCubit.resend(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ResetPasswordVerificationCubit,
            ResetPasswordVerificationState>(
          listenWhen: (previousState, state) {
            return previousState is! ResetPasswordVerificationErrorState &&
                state is ResetPasswordVerificationErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is ResetPasswordVerificationErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ResetPasswordVerificationCubit,
            ResetPasswordVerificationState>(
          listener: (BuildContext context, state) {
            if (state is ResetPasswordVerificationSuccessState) {
              context.push(
                ResetPasswordScreen.route,
                extra: {
                  "email": state.email,
                  "code": state.code,
                },
              );
            }
            if (state is ResendResetPasswordCodeSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(DefaultSnackBar(
                  text: getLang(context, "otp_has_been_resent")));
            }
          },
        )
      ],
      child: AuthScaffold(
        onBackPressed: () =>context.pop(),
        isLogin: false,
        screenName: 'reset_password',
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getLang(context, "enter_verification_code"),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: SyncColors.background,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    getLang(context, "check_code_message"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: SyncColors.background,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OneTimePasswordTextField(
                  length: 5,
                  pinController: pinTextEditingController,
                  onChanged: (value) {
                    if (pinTextEditingController.text.length == 5) {
                      context
                          .read<ResetPasswordVerificationCubit>()
                          .toggleVerifyButtonState(true);
                    } else {
                      context
                          .read<ResetPasswordVerificationCubit>()
                          .toggleVerifyButtonState(false);
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getLang(context, "didn't_received_code"),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: SyncColors.background,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: onResendPressed,
                      child: Text(
                        getLang(context, "resend_code"),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: SyncColors.pistach,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                BlocBuilder<ResetPasswordVerificationCubit,
                    ResetPasswordVerificationState>(
                  builder: (context, state) {
                    return DefaultButton(
                      onPressed: onVerifyResetPasswordCodePressed,
                      text: getLang(context, "confirm"),
                      textColor: Colors.white,
                      backgroundColor: SyncColors.darkBlue,
                      isLoading: state is ResetPasswordVerificationLoadingState,
                      enabled: state.verifyButtonEnabled,
                      width: 160,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
