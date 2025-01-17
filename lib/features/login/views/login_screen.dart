import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/login/widgets/custom_user_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constans.dart';
import '../../../core/utils/app_router.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showMessage('All fields are required.');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    if (username == savedUsername && password == savedPassword) {
      _showMessage('Login Successful!');
      GoRouter.of(context).push(AppRouter.kHomeView);
    } else {
      _showMessage('Invalid username or password.');
    }
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
              padding: const EdgeInsets.only(top: 100, left: 100),
              child: Text(
                'Login',
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
                      const SizedBox(height: 24),
                      CustomUserButton(
                        text: 'Login',
                        onPressed: _login,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                GoRouter.of(context).push(AppRouter.kRegisterScreen),
                            child: Text(
                              'Register',
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