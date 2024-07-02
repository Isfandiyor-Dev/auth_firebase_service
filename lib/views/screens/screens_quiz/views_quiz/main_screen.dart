import 'package:auth_firebase_service/controllers/auth_controller.dart';
import 'package:auth_firebase_service/utils/messages.dart';
import 'package:auth_firebase_service/utils/routes.dart';
import 'package:auth_firebase_service/views/screens/screens_quiz/views_quiz/custom_quiz_manage/custom_quizzes.dart';
import 'package:auth_firebase_service/views/screens/screens_quiz/views_quiz/quiz_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onTapLogOut() {
    Messages.showLoadingDialog(context);
    Provider.of<AuthController>(
      context,
      listen: false,
    ).logOut().then((value) {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: onTapLogOut,
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(200, 70),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => QuizGame()));
              },
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(200, 70),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const CustomQuizzes(),
                  ),
                );
              },
              child: const Text(
                "Custom Quizzes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
