import 'package:car_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../../widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pushReplacementNamed(context,
           AppRoutes.getstarted
           );
        },
      ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SignUpForm(),
      ),
    );
  }
}
