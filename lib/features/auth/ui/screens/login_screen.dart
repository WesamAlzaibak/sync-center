import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/core/ui/reusables/scaffolds/auth_scaffold.dart';

import '../../../../core/ui/reusables/buttons/default_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/reusables/textfields/default_text_field.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/app_local.dart';
import '../../../../core/utils/auth_validators.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../blocs/login/login_cubit.dart';
import '../blocs/login/login_state.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const route = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final loginCubit = context.read<LoginCubit>();
      loginCubit.login(email: email, password: password);
    }
  }

  void onObscurePasswordPressed() {
    context.read<LoginCubit>().toggleObscurePassword();
  }

  void onForgetPasswordPressed() {
    context.push(ForgetPasswordScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (previousState, state) {
            return previousState is! LoginErrorState && state is LoginErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listener: (BuildContext context, state) {
            if (state is LoginSuccessState) {
                context.go(HomeScreen.route);
            }
          },
        ),
      ],
      child: AuthScaffold(
        onBackPressed: () {},
        isLogin: true,
        screenName: 'login',
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextField(
                keyboardType: TextInputType.emailAddress,
                hint: 'example@gmail.com',
                prefixIcon: const Icon(Icons.email_outlined, color: SyncColors.background),
                label: Text(getLang(context, "email_address")),
                validator: (value) => AuthValidators.validateEmail(value!, context),
                controller: _emailController,
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return DefaultTextField(
                        keyboardType: TextInputType.visiblePassword,
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
                        validator: (value) => AuthValidators.validateLoginPassword(value!, context),
                        obscureText: state.obscurePassword,
                        label: Text(getLang(context, "password")),
                        controller: _passwordController,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 12),
                    child: InkWell(
                      onTap: onForgetPasswordPressed,
                      child: Text(
                        getLang(context, "forget_password"),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: SyncColors.pistach,
                          decoration: TextDecoration.underline,
                          decorationColor: SyncColors.pistach,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (BuildContext context, state) {
                  return DefaultButton(
                    onPressed: onLoginPressed,
                    text: getLang(context, "login"),
                    textColor: SyncColors.background,
                    backgroundColor: SyncColors.darkBlue,
                    isLoading: state is LoginLoadingState,
                    enabled: true,
                    width: 238,
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
