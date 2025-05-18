import 'package:flutter/material.dart';

class TextFieldLogin extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const TextFieldLogin({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email TextFormField
        TextFormField(
          controller: widget.emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Password Text Field
        TextFormField(
          controller: widget.passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password !!!';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters !!!';
            }
            return null;
          },
        ),
      ],
    );
  }
}
