// ignore_for_file: use_build_context_synchronously
import 'package:bookly_app/constans.dart';
import 'package:bookly_app/features/auth/widgets/custom_row.dart';
import 'package:bookly_app/features/auth/widgets/custom_text_field.dart';
import 'package:bookly_app/features/auth/widgets/custom_user_button.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // حفظ بيانات المستخدم في SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('confirmPassword', confirmPassword);

    // عرض رسالة النجاح

    FancySnackbar.show(context, 'Successfully Registered',
        logo: const Icon(Icons.check, color: Colors.green, size: 32),
        seconds: 2);
    GoRouter.of(context).push(AppRouter.kLoginScreen);

    // عرض رسالة النجاح
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50),
              child: Text(
                'Register',
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 80,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 300),
              height: double.infinity,
              width: size.width,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          label: 'Email',
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return 'Passwords don\'t match';
                            }
                            return null;
                          },
                          label: 'Password',
                          isPassword: true,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password is required';
                            }
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return 'Passwords don\'t match';
                            }
                            return null;
                          },
                          label: 'Confirm Password',
                          isPassword: true,
                          controller: _confirmPasswordController,
                        ),
                        const SizedBox(height: 24),
                        CustomUserButton(
                          text: 'Register',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        const CustomRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
