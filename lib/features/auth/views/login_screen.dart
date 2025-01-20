// ignore_for_file: use_build_context_synchronously
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/auth/widgets/custom_text_button.dart';
import 'package:bookly_app/features/auth/widgets/custom_user_button.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 Future<void> _login() async {
  if (formKey.currentState!.validate()) {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Access shared preferences
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    // Check if the credentials match
    if (username == savedUsername && password == savedPassword) {
      // Successful login
       FancySnackbar.show(context, 'Successfully Logged In',
       logo: const Icon(Icons.check, color: Colors.green, size: 32),
       seconds: 2
       );
    
      // Navigate to home
      GoRouter.of(context).push(AppRouter.kHomeView);
    } else {    
      FancySnackbar.show(context, 'Invalid Email or Password',
       logo: const Icon(Icons.error, color: Colors.red, size: 32),
       seconds: 2
       );
      // Invalid credentials
      
    }
  }
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        CustomTextField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter your Email';
                              
                            }
                            return null;
                          },
                          label: 'Email',
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter your Password';
                            } if(value.length<8){
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          label: 'Password',
                          isPassword: true,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 24),
                        CustomUserButton(
                          text: 'Login',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _login();
                            }
                          },
                        ),
                        const SizedBox(height: 5),
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
                             CustomTextButton(
                          text: 'Register',
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kRegisterScreen);
                          },
                        )
                          ],
                        )
                      
                       
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

