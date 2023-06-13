import 'package:flutter/material.dart';
import 'package:googlecloud/Models/userModel.dart';
import 'package:googlecloud/Services/dataServices.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: const Color.fromARGB(255, 248, 228, 191),
            title: const Text(
              "Forget Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                    }

                    // Email format validation using a regular expression
                    // You can modify the regular expression pattern as per your requirements
                    String emailRegex =
                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
                    RegExp regex = RegExp(emailRegex);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Your Email"),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Password format validation using a regular expression
                    // You can modify the regular expression pattern as per your requirements
                    String passwordRegex =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regex = RegExp(passwordRegex);
                    if (!regex.hasMatch(value)) {
                      return 'It should contain at least 8 characters, including uppercase, lowercase, numeric, and special characters.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextButton(
                    onPressed: () {
                      DataServices().forgetPassword(
                          UserModel(
                              email: controller.text,
                              password: passwordController.text),
                          context);
                          controller.clear();
                          passwordController.clear();
                    },
                    child: const Text("Forget Password",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ));
  }
}
