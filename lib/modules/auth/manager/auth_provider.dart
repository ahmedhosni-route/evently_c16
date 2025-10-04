import 'package:evently_c16_online/core/app_dialogs/app_dialogs.dart';
import 'package:evently_c16_online/core/routes/app_route_name.dart';
import 'package:evently_c16_online/modules/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> password = ValueNotifier<bool>(true);
  bool isLoading = false;
  Future<void> createAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        var user = await AuthServices.createAccount(
            emailController.text, passwordController.text, nameController.text);
        AppDialogs.showMessage(context, title: "Please check your Inbox");
      } catch (e) {
        AppDialogs.showMessage(context,
            title: e.toString(), type: MessageType.error);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        var user = await AuthServices.login(
            emailController.text, passwordController.text);
        if (user.user!.emailVerified) {
          Navigator.pushReplacementNamed(context, AppRouteName.layout);
          AppDialogs.showMessage(context,
              title: "welcome , ${user.user?.displayName ?? ""}");
        } else {
          AppDialogs.showMessage(context,
              title: "Email not verified , check your email",
              type: MessageType.error);
        }
      } catch (e) {
        AppDialogs.showMessage(context,
            title: e.toString(), type: MessageType.error);
      }
    }
    isLoading = false;
    notifyListeners();
  }

}
