// ignore: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/userModel.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Views/forgetPassword.dart';

class SignInScreen extends StatefulWidget {
  final String? token;
  const SignInScreen({super.key, this.token});

  @override
  State<SignInScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignInScreen> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: const Color.fromARGB(255, 248, 228, 191),
          title: const Text("SignIn Screen",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign IN',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: "Username"),  
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.016),
                TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration:  InputDecoration(labelText: "Password",
                   suffixIcon:  IconButton(
                        icon: _isPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
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
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.016),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.black),
                                );
                              });

                          DataServices().signInUser(
                              UserModel(
                                  username: usernameController.text,
                                  password: passwordController.text),
                                    widget.token,
                              context);

                          usernameController.clear();
                          passwordController.clear();

                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: const Text("Sign In Button")),
                SizedBox(height: MediaQuery.of(context).size.width * 0.032),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Don't have an account | Create one?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      )),
                ),
                 SizedBox(height: MediaQuery.of(context).size.width * 0.032),
                 GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgetPassword()));
                  },
                  child: Text("Forget Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
