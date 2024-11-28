import 'package:car_app/Features/home/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../home/presentation/views/errors/error_view.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_snack_bar.dart';
import 'custom_button_widget.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextField(
            controller: emailController,
            labelText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(
            text: 'Sign In',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<AuthBloc>(context).add(
                  SignInEvent(emailController.text, passwordController.text),
                );
              }
            },
          ),
          BlocListener<AuthBloc, MyAuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                CustomSnackBar.show(
                  context, 'Signed In as ${state.email}',
                  color: Colors.green,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.main,
                  (Route<dynamic> route) => false,
                );
              } else if (state is AuthFailureState) {
                CustomSnackBar.show(context, state.message);
              }
            },
            child: BlocBuilder<AuthBloc, MyAuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CustomCircleIndicator();
                }
                return const ErrorView();
              },
            ),
          ),
        ],
      ),
    );
  }
}