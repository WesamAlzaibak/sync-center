import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/auth/ui/screens/reset_password_screen.dart';


import '../../../../core/ui/reusables/buttons/default_button.dart';
import '../../../../core/ui/reusables/scaffolds/auth_scaffold.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/reusables/textfields/default_text_field.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/app_local.dart';
import '../../../../core/utils/auth_validators.dart';
import '../blocs/forget_password/forget_password_cubit.dart';
import '../blocs/forget_password/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  static const route = "/forget_password_screen";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSendPressed() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
      forgetPasswordCubit.requestResetPassword(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listenWhen: (previousState, state) {
            return previousState is! ForgetPasswordErrorState &&
                state is ForgetPasswordErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is ForgetPasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (BuildContext context, state) {
            if (state is ForgetPasswordSuccessState) {
              context.push(
                ResetPasswordScreen.route,
                extra: {
                  "email": state.email,
                },
              );
            }
          },
        )
      ],
      child: AuthScaffold(
        onBackPressed: () {
          context.pop();
        },
        isLogin: false,
        screenName: 'reset_password',
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  getLang(context, "enter_email_address"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SyncColors.background,
                  ),
                ),
              ),
              const SizedBox(height: 26),
              DefaultTextField(
                keyboardType: TextInputType.phone,
                hint: 'example@gmail.com',
                prefixIcon:
                const Icon(Icons.email_outlined, color: SyncColors.background),
                label: Text(getLang(context, "email_address")),
                validator: (value) =>
                    AuthValidators.validateEmail(value!, context),
                controller: emailController,
              ),
              const SizedBox(height: 48),
              BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                builder: (context, state) {
                  return DefaultButton(
                    onPressed: onSendPressed,
                    text: getLang(context, "send_phone"),
                    textColor: Colors.white,
                    backgroundColor: SyncColors.darkBlue,
                    isLoading: state is ForgetPasswordLoadingState,
                    enabled: true,
                    width: 212,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}