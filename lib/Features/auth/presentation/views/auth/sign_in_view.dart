import 'package:flutter/material.dart';
import '../../widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SignInForm(),
      ),
    );
  }
}
