// login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Login/widgets/button_signup.dart';
import 'package:flutter_application_1/Auth/Login/widgets/login_fields.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget to TextField
              TextFieldLogin(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(height: 24),
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // Function To Login
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    setState(() => _isLoading = true);

                    final loginModel = Provider.of<LoginModel>(
                      context,
                      listen: false,
                    );
                    //  success stored a boolean Value
                    final success = await loginModel.login(
                      _emailController.text,
                      _passwordController.text,
                    );

                    setState(() => _isLoading = false);

                    if (success) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid email or password'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  // Loading Button
                  child:
                      _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                ),
              ),
              // Navigate to Signup Page
              ButtonSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
