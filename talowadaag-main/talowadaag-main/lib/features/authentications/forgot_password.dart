import 'package:flutter/material.dart';
import 'package:talowadaag/common/widgets/text_button.dart';
import 'package:talowadaag/features/authentications/signin_screen.dart';

import 'basic_auth_screen.dart';

class ForgotPasswordScreen extends BasicAuthScreen {
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'Enter your email address below and we\'ll send you a link to reset your password.',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 10,
                ),
                informationForm(),
                const SizedBox(
                  height: 10,
                ),
                CustomTextButton(
                  hasOverlay: true,
                  widget: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                    ),
                  ),
                  onTap: () {
                    backToLoginPage();
                  },
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Form informationForm() {
    // TODO: implement informationForm
    return Form(
      key: formKey,
      child: Column(
        children: [
          emailTextField(),
          const SizedBox(
            height: 20,
          ),
          submitButton(
            buttonTitle: 'Reset password',
            onSubmit: () {
              if (!formKey.currentState!.validate()) return;
              backToLoginPage();
            },
          ),
        ],
      ),
    );
  }

  void backToLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SingInScreen()));
  }
}
