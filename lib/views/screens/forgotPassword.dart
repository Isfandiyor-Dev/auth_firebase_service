import 'package:auth_firebase_service/views/widgets/my_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void resetPassoword() {
    if (formKey.currentState!.validate()) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 40,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                "Enter your email and we will send you a password reset link!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              MyTextFiled(
                textController: emailController,
                hintText: "Email",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
