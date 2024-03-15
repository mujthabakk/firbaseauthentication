import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_1/view/pages/homepage.dart';
import 'package:firbase_1/view/pages/widget/textfild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "mujthaba@gmail.com");
    TextEditingController passController = TextEditingController(text:"12345678");
    TextEditingController nameController = TextEditingController(text: 'mujthaba');
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("RegisterPage"),
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
            Textformfield(
              hinttext: 'Enter your name',
              labeltext: "Enter user name",
              icons: Icons.person,
              textEditingController: nameController,
              formvalidator: (value) {
                if (value!.isEmpty) {
                  return "Enter user name";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  formkey.currentState!.validate();
                  if (formkey.currentState!.validate()) {
                    UserCredential userdata = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passController.text.trim());
                    if (userdata.user != null) {
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(userdata.user!.uid)
                          .set({
                        "uid": userdata.user!.uid,
                        "email": userdata.user!.email,
                        "name": nameController.text,
                        "CreateAt": DateTime.now(),
                        "status": 1,
                      }).then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              )));
                    }
                  }
                },
                child: const Text("Register "))
          ],
        ),
      ),
    );
  }
}
