// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firbase_1/pages/Homepage.dart';
import 'package:firbase_1/pages/register_page.dart';
import 'package:firbase_1/widget/textfild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("login Page"),
            const SizedBox(
              height: 40,
            ),
            Textformfield(
              hinttext: 'Enter your email',
              labeltext: "Enter user email ",
              icons: Icons.person,
              textEditingController: emailController,
              formvalidator: (value) {
                if (value!.isEmpty) {
                  return "Enter user password";
                }
                return null;
              },
            ),
            Textformfield(
              hinttext: 'Enter your password',
              labeltext: "Enter user password",
              icons: Icons.lock,
              textEditingController: passController,
              formvalidator: (value) {
                if (value!.isEmpty) {
                  return "Enter user password";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  formkey.currentState!.validate();
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  }
                },
                child: const Text("Loging")),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                },
                child: const Text("create new account"))
          ],
        ),
      ),
    );
  }
}
