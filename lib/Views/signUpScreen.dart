// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:googlecloud/Models/userModel.dart';
import 'package:googlecloud/Services/dataServices.dart';
import 'package:googlecloud/Views/signInScreen.dart';

class SignUpScreen extends StatefulWidget {
  final String? token;
  const SignUpScreen({super.key,  this.token});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 248, 228, 191),
        centerTitle: true,
        title: const Text("SignUp Screen",
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
                'Sign UP',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Username';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: "Username"),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.016),
              TextFormField(
                controller: emailController,
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
                decoration: const InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.016),
              TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration:  InputDecoration(labelText: "Password",
                suffixIcon: IconButton(
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
                          emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.brown[200],
                                ),
                              );
                            });

                        DataServices().createUser(
                            UserModel(
                                username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text),
                                widget.token,
                            context);

                        usernameController.clear();
                        emailController.clear();
                        passwordController.clear();

                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text("Sign Up Button")),
              SizedBox(height: MediaQuery.of(context).size.width * 0.032),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>  SignInScreen(token: widget.token,)));
                },
                child: Text("Already have an account | SignIn?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
