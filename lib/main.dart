import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'textfield/text.dart';
import 'buttonfield/button.dart';

void main() {
  runApp(const Musandam());
}

class Musandam extends StatelessWidget {
  const Musandam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void printValue() {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      debugPrint('Name : $name');
      debugPrint('Email : $email');
      debugPrint('Password : $password');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile Updated Successfully!'),
          backgroundColor: Colors.lightGreen,
        ),
      );
    }
  }

  void exitApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        image: AssetImage('images/logo.png'),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/avatar.png'),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                Text(
                  'Usman Ghani',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
                CustomTextField(
                  hintText: 'Your Full Name',
                  icon: Icons.person,
                  obscureText: false,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Your Email',
                  icon: Icons.email_rounded,
                  obscureText: false,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Password',
                  icon: Icons.lock_rounded,
                  obscureText: !isPasswordVisible,
                  controller: passwordController,
                  isPasswordField: true,
                  toggleVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock_rounded,
                  obscureText: !isConfirmPasswordVisible,
                  controller: confirmPasswordController,
                  isPasswordField: true,
                  toggleVisibility: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                CustomButton(
                  text: 'Update Profile',
                  setstate: printValue,
                ),
                CustomButton(
                  text: 'Logout',
                  setstate: exitApp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
