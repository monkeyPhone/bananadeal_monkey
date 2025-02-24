import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../css/style.dart';
import 'auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.white,
    );
  }
}
