import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller; 
  final String? Function(String?)? validator; // إضافة TextEditingController

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller, this.validator, // تمرير TextEditingController
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPassword; // Initialize visibility state
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller, // استخدام TextEditingController
      obscureText: _isPasswordVisible,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
