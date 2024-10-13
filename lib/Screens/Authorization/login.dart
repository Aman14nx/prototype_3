import 'package:flutter/material.dart';
import 'package:prototype_3/Components/button.dart';
import 'package:prototype_3/Screens/Background/logsin.dart';
import 'package:prototype_3/Components/textfield.dart';
import 'package:prototype_3/Screens/Authorization/signup.dart';
import 'package:prototype_3/Screens/Dashboard/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usrName = TextEditingController();
  final password = TextEditingController();
  bool isValidated = false;
  bool isLoginTrue = false;
  final formKey = GlobalKey<FormState>();
  //final DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Background(
      image: "loginpage.png", // Pass the correct image for login
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

  /*Widget header() {
    return const ListTile(
      title: Text("Welcom"),
      subtitle: Text("Enter Your Credentials to access your account"),
    );
  }
*/

  Widget header() {
    return const ListTile(
      title: Text(
        "Welcome",
        style: TextStyle(
          fontSize: 54, // Bigger font size
          fontWeight: FontWeight.bold, // Bold font weight
        ),
        textAlign: TextAlign.center, // Center the text
      ),
      subtitle: Text("     Enter Your Credentials to access your account"),
    );
  }

//////
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

              //Button
              Button(
                label: "Login",
                press: () {
                  if (formKey.currentState!.validate()) {
                    // Validate credentials
                    if (usrName.text == 'wiscomsystems@gmail.com' &&
                        password.text == '1234') {
                      // If credentials are correct, navigate to the new screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Home()), // Replace with your new screen widget
                      );
                    } else {
                      // Show error message if credentials don't match
                      setState(() {
                        isValidated = true;
                      });
                    }
                  }
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text("Register")),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text("Forgot Password"))
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
          isLoginTrue
              ? Text(
                  "Access Denied, user name or password incorrect",
                  style: TextStyle(color: Colors.red.shade900),
                )
              : const SizedBox(),
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
