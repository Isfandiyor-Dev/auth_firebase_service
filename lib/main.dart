import 'package:auth_firebase_service/controllers/auth_controller.dart';
import 'package:auth_firebase_service/controllers/quiz_controller.dart';
import 'package:auth_firebase_service/firebase_options.dart';
import 'package:auth_firebase_service/utils/routes.dart';
import 'package:auth_firebase_service/views/screens/forgotPassword.dart';
import 'package:auth_firebase_service/views/screens/login_screen.dart';
import 'package:auth_firebase_service/views/screens/register_screen.dart';
import 'package:auth_firebase_service/views/screens/screens_quiz/views_quiz/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => QuizController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
        routes: {
          AppRoutes.home: (context) => const MainScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.forgotPw: (context) => ForgotPassword(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MainScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
      
    );
  }
}
