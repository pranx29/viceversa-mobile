import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viceversa/routes/app_routes.dart';
import 'package:viceversa/views/shared/custom_form_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                height: 60,
                  child: SvgPicture.asset('assets/icons/logo.svg',
                    color: Theme.of(context).colorScheme.primary,)
              ),
            ),
            Text("Login to your account", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomFormTextField(
                  controller: emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    const emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
                    final regex = RegExp(emailPattern);
                    if (!regex.hasMatch(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                CustomFormTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.main,
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
