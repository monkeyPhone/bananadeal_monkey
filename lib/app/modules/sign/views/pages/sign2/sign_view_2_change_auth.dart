import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/sign_change_auth/sign_change_auth_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';



class SignView2ChangeAuth extends GetView<SignView2ChangeAuthController> {
  final String email;
  final String domain;
  const SignView2ChangeAuth({
    required this.email,
    required this.domain,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller.getEmailDomain(email, domain);
    return GestureDetector(
              onTap: ()=> FocusScope.of(context).unfocus(),
              child: Scaffold(
                        backgroundColor: Colors.white,
                        resizeToAvoidBottomInset : false,
                        appBar: AppBar(),
              body: SignChangeAuthBody(
                email: email,
                domain: domain,
              ),
              )
    );
  }

}
