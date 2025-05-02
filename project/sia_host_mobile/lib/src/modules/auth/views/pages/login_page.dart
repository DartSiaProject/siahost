import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/dto/login_dto.dart';
import 'package:sia_host_mobile/src/modules/auth/logic/cubit/auth_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/password_input.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _serverAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _serverAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            AppSnackBar.error(
              message: state.error.toString(),
            );
          } else if (state is AuthSuccess) {
            context.router.pushAndPopUntil(
              const DashboardRoute(),
              predicate: (router) => false,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    SizedBox(height: 8.h),
                    Center(
                      child: Image.asset(
                        'assets/images/secure_server.png',
                        width: 200.w,
                        // height: 50.h,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.loginDesc,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        color: Colors.white,
                      ),
                    ),
                    AppInput(
                      labelText: context.l10n.serverAddressField,
                      hintText: context.l10n.serverAddressFieldHint,
                      controller: _serverAddressController,
                      keyboardType: TextInputType.url,
                      autofillHints: const [
                        AutofillHints.url,
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: context.l10n.requiredField,
                        ),
                        FormBuilderValidators.match(
                          RegExp(renterdAddressPattern),
                          errorText: context.l10n.invalidAddressFormat,
                        ),
                      ]),
                    ),
                    AppInput(
                      labelText: context.l10n.emailField,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: context.l10n.requiredField,
                        ),
                        FormBuilderValidators.email(
                          errorText: context.l10n.invalidEmail,
                        ),
                      ]),
                    ),
                    PasswordInput(
                      labelText: context.l10n.passwordField,
                      controller: _passwordController,
                      validator: FormBuilderValidators.required(
                        errorText: context.l10n.requiredField,
                      ),
                    ),
                    AppButton(
                      isFullSized: true,
                      isLoading: state is AuthLoading,
                      label: context.l10n.loginButton,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<AuthCubit>().login(
                                LoginDto(
                                  serverAddress:
                                      _serverAddressController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                ),
                              );
                        } else {
                          AppSnackBar.warning(
                            message: context.l10n.invalidForm,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
