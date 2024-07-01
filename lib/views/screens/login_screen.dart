import 'package:auth_firebase_service/controllers/auth_controller.dart';
import 'package:auth_firebase_service/utils/messages.dart';
import 'package:auth_firebase_service/utils/routes.dart';
import 'package:auth_firebase_service/views/widgets/my_square_tile.dart';
import 'package:auth_firebase_service/views/widgets/my_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void onLoginTap() {
    if (formKey.currentState!.validate()) {
      Messages.showLoadingDialog(context);
      Provider.of<AuthController>(context, listen: false)
          .logIn(
        emailController.text,
        passwordController.text,
      )
          .then((value) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 100,
                  ),
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(
                      fontSize: 20,
                      height: 5,
                      color: Colors.grey[800],
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
                  const SizedBox(height: 25),
                  MyTextFiled(
                    textController: passwordController,
                    hintText: "Password",
                    validation: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size.fromHeight(65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          return onLoginTap();
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySquareTile(imagePath: "assets/google.png"),
                      SizedBox(width: 15),
                      MySquareTile(imagePath: "assets/apple.png"),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.register,
                          );
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
