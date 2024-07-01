import 'package:auth_firebase_service/controllers/auth_controller.dart';
import 'package:auth_firebase_service/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTapLogOut() {
    Messages.showLoadingDialog(context);
    Provider.of<AuthController>(context, listen: false).logOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: onTapLogOut,
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
