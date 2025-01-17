import 'package:bookly_app/constans.dart';
import 'package:bookly_app/features/login/widgets/custom_text_field.dart';
import 'package:bookly_app/features/login/widgets/custom_user_button.dart';
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
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
  final username = _usernameController.text.trim();
  final password = _passwordController.text.trim();
  final confirmPassword = _confirmPasswordController.text.trim();

     if (username.isEmpty) {
    _showMessage('Username is required.');
    return;
  }
  if (password.isEmpty) {
    _showMessage('Password is required.');
    return;
  }
  if (confirmPassword.isEmpty) {
    _showMessage('Confirm Password is required.');
    return;
  }

  // التحقق من تطابق كلمة المرور
  if (password != confirmPassword) {
    _showMessage('Passwords do not match.');
    return;
  }
     // حفظ بيانات المستخدم في SharedPreferences
   final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
  await prefs.setString('password', password);

    
    _showMessage('Registration Successful!');
    GoRouter.of(context).push(AppRouter.kLoginScreen);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      CustomTextField(
                        label: 'Username',
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Confirm Password',
                        isPassword: true,
                        controller: _confirmPasswordController,
                      ),
                      const SizedBox(height: 24),
                      CustomUserButton(
                        text: 'Register',
                        onPressed: _register,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                GoRouter.of(context).push(AppRouter.kLoginScreen),
                            child: Text(
                              'Login',
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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