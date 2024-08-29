import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/reusables/buttons/default_button.dart';
import '../../../../core/ui/reusables/scaffolds/auth_scaffold.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/reusables/textfields/default_text_field.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/app_local.dart';
import '../../../../core/utils/auth_validators.dart';
import '../blocs/reset_password/reset_password_cubit.dart';
import '../blocs/reset_password/reset_password_state.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const route = '/reset_password_screen';

  final String email;
  final String code;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void onResetPressed() {
    if (formKey.currentState!.validate()) {
      final password = passwordController.text;
      final resetPasswordCubit = context.read<ResetPasswordCubit>();
      resetPasswordCubit.resetPassword(
        code: widget.code,
        newPassword: password,
        email: widget.email,
      );
    }
  }

  void onObscurePasswordPressed() =>
      context.read<ResetPasswordCubit>().toggleObscurePassword();

  void onObscureConfirmPasswordPressed() =>
      context.read<ResetPasswordCubit>().toggleObscureConfirmPassword();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listenWhen: (previousState, state) {
              return previousState is! ResetPasswordErrorState &&
                  state is ResetPasswordErrorState;
            },
            listener: (BuildContext context, state) {
              if (state is ResetPasswordErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    DefaultSnackBar(text: state.exception.toString()));
              }
            },
          ),
          BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (BuildContext context, state) {
              if (state is ResetPasswordSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(
                    text: getLang(context, "password_changed_successfully"),
                  ),
                );
                context.go(LoginScreen.route);
              }
            },
          )
        ],
        child: AuthScaffold(
          onBackPressed: () {},
          isLogin: true,
          screenName: 'reset_password',
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  getLang(context, "enter_new_password_message"),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: SyncColors.background,
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return DefaultTextField(
                      keyboardType: TextInputType.text,
                      hint: '•••••••••••••',
                      prefixIcon: const Icon(Icons.lock_outline_rounded, color: SyncColors.background),
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: SyncColors.background,
                        ),
                        onPressed: onObscurePasswordPressed,
                      ),
                      validator: (value) => AuthValidators.validatePassword(value!, context),
                      obscureText: state.obscurePassword,
                      label: Text(getLang(context, "password")),
                      controller: passwordController,
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return DefaultTextField(
                      keyboardType: TextInputType.text,
                      hint: '•••••••••••••',
                      prefixIcon: const Icon(Icons.lock_outline_rounded, color: SyncColors.background),
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: SyncColors.background,
                        ),
                        onPressed: onObscureConfirmPasswordPressed,
                      ),
                      validator: (value) => AuthValidators.validateConfirm(value!, passwordController.text,context),
                      obscureText: state.obscureConfirmPassword,
                      label: Text(getLang(context, "confirm_password")),
                      controller: confirmPasswordController,
                    );
                  },
                ),
                const SizedBox(height: 48),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return DefaultButton(
                      onPressed: onResetPressed,
                      text: getLang(context, "reset_password"),
                      textColor: Colors.white,
                      backgroundColor: SyncColors.darkBlue,
                      isLoading: state is ResetPasswordLoadingState,
                      enabled: true,
                      width: 200,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
