import 'package:car_app/core/utils/app_colors.dart';
import 'package:car_app/core/utils/app_icons.dart';
import 'package:car_app/core/utils/app_routes.dart';
import 'package:car_app/core/utils/contants.dart';
import 'package:car_app/presentation/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth/form_bloc.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 600;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: isSmallScreen
                  ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _Logo(),
                        _FormContent(),
                      ],
                    )
                  : const _DesktopLayout(),
            );
          },
        ),
      ),
    );
  }
}

// Desktop Layout (for larger screens)
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      constraints: const BoxConstraints(maxWidth: 800),
      child: const Row(
        children: [
          Expanded(child: _Logo()),
          Expanded(child: Center(child: _FormContent())),
        ],
      ),
    );
  }
}

// Logo Widget (Shared across small and large screens)
class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to RS Mobiles!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

// Form Content Widget with State Management
class _FormContent extends StatefulWidget {
  const _FormContent();

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final bool _isPasswordVisible = false;
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormBloc(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _EmailField(),
              _gap(),
              _PasswordField(isPasswordVisible: _isPasswordVisible),
              _gap(),
              _RememberMeCheckbox(
                rememberMe: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              _gap(),
              _SignInButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

// Email Field with Validation
class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Email';
        }
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
        if (!emailValid) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(AppIcons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}

// Password Field with Toggle Visibility
class _PasswordField extends StatelessWidget {
  final bool isPasswordVisible;
  const _PasswordField({required this.isPasswordVisible});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, bool>(
      builder: (context, isPasswordVisible) {
        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                context.read<FormBloc>().togglePasswordVisibility();
              },
            ),
          ),
        );
      },
    );
  }
}

// Remember Me Checkbox
class _RememberMeCheckbox extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onChanged;
  const _RememberMeCheckbox({required this.rememberMe, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: rememberMe,
      onChanged: onChanged,
      title: const Text('Remember me'),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: const EdgeInsets.all(0),
    );
  }
}

// Sign In Button
class _SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _SignInButton({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: AppConstants.cardBorderRadius,
      color: AppColors.primaryLight,
      textcolor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 120,
            vertical: 10,
            
            
          ),
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {

            Navigator.pushReplacementNamed(context,
             AppRoutes.main
             );
          }
        }, text: 'Login',
    );
  }
}
