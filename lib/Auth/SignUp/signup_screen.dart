// signup_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/SignUp/widgets/button_login.dart';
import 'package:flutter_application_1/Auth/SignUp/widgets/signup_fields.dart';
import 'package:provider/provider.dart';
import 'signup_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupModel = Provider.of<SignupModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Widget to TextFieldSignup
                TextFieldSignup(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        signupModel.isLoading
                            ? null
                            : () async {
                              if (_formKey.currentState!.validate()) {
                                // Call the signup method from the model
                                final success = await signupModel.signup(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                  _confirmPasswordController.text,
                                  context,
                                );
                                if (success) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                }
                              }
                            },
                    child:
                        signupModel.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Sign Up'),
                  ),
                ),
                // To Login Page
                ButtonLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
