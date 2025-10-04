import 'package:animate_do/animate_do.dart';
import 'package:evently_c16_online/core/routes/app_route_name.dart';
import 'package:evently_c16_online/core/widgets/custom_btn.dart';
import 'package:evently_c16_online/modules/auth/manager/auth_provider.dart';
import 'package:evently_c16_online/modules/auth/services/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      children: [
                        Center(
                            child: FadeInDown(
                                child: Hero(
                                    tag: "logo",
                                    child: Image.asset("assets/logo/app_logo.png")))),
                        FadeInUp(
                          // duration: const Duration(seconds: 2),
                          child: Hero(
                            tag: "appName",
                            child: Material(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Text(
                                "Evently",
                                style: GoogleFonts.jockeyOne(
                                    color: AppColors.primaryColor, fontSize: 36),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: provider.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Name";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person), hintText: "Name"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: provider.emailController,

                          validator: (value) {
                            final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value ?? "");
                            if (value == null || value.isEmpty) {
                              return "Enter email";
                            } else if (!emailValid) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                              hintText: "Email"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ValueListenableBuilder(

                          valueListenable: provider.password,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: provider.passwordController,

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please , Enter password";
                                } else if (value.length < 6) {
                                  return "Password must be than more 6 char";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: value,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      provider.password.value = !provider.password.value;
                                    },
                                    child: Icon(value
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Password",
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ValueListenableBuilder(
                          valueListenable: provider.password,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: provider.rePasswordController,

                              validator: (value) {
                                if (value != provider.passwordController.text ) {
                                  return "Password not matched";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: value,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    provider.password.value = !provider.password.value;
                                  },
                                  child: Icon(value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                hintText: "Re-Password",
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomBtn(
                            isExpanded: true,
                            isLoading: provider.isLoading,
                            onTap: () {
                              provider.createAccount(context);
                            },
                            text: "Create account "),
                        const SizedBox(
                          height: 24,
                        ),
                        Text.rich(TextSpan(text: "You Have Account ? ", children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, AppRouteName.login);
                              },
                            text: "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor),
                          )
                        ])),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
