import 'package:flutter/material.dart';
import 'package:prototype_3/Components/button.dart';
import 'package:prototype_3/Screens/Background/logsin.dart';
import 'package:prototype_3/Components/textfield.dart';
import 'package:prototype_3/Screens/Authorization/login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usrName = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isValidated = false;
  final formKey = GlobalKey<FormState>();
  //final DatabaseHelper db = DatabaseHelper();
  /*register() async {
    var res = await db.createUser(Users(
        fullName: fullname.text,
        email: email.text,
        usrName: usrName.text,
        password: password.text));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Background(
      image: "signup.png", // Pass the correct image for signup
      height: .75, // Adjust height if needed
      child: Form(
        key: formKey,
        child: Column(
          children: [
            header(),
            body(),
            message(),
          ],
        ),
      ),
    );
  }

// Header
  Widget header() {
    return const Center(
      child: Text(
        "Register",
        style: TextStyle(
          fontSize: 32, // Increase the font size
          // fontWeight: FontWeight.bold, // Make the text bold
        ),
        textAlign: TextAlign.center, // Center the text horizontally
      ),
    );
  }

  Widget body() {
    // Typing box
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Name is required";
                    }
                    return null;
                  },
                  hintText: "Full Name",
                  icon: Icons.person,
                  controller: fullname),
              InputField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  hintText: "Email Address",
                  icon: Icons.email,
                  controller: email),
              InputField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                  hintText: "Username",
                  icon: Icons.account_circle_rounded,
                  controller: usrName),
              InputField(
                  trailing: const Icon(Icons.visibility_off),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  hintText: "Password",
                  icon: Icons.lock,
                  controller: password),

              InputField(
                  trailing: const Icon(Icons.visibility_off),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Re-Password is required";
                    } else if (password.text != confirmPassword.text) {
                      return "Password dont match";
                    }
                    return null;
                  },
                  hintText: "Re-enter password",
                  icon: Icons.lock,
                  controller: confirmPassword),

              //Button
              Button(
                  label: "Register",
                  press: () {
                    if (formKey.currentState!.validate()) {
                      // register();
                      setState(() {
                        isValidated = false;
                      });
                    } else {
                      setState(() {
                        isValidated = true;
                      });
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text("Login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget message() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          isValidated
              ? Text(
                  "Form is not Validated,Check above",
                  style: TextStyle(color: Colors.red.shade900),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
