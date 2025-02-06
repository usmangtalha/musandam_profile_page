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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void printValue() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    debugPrint('Name : $name');
    debugPrint('Email : $email');
    debugPrint('Password : $password');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Name : $name, Email : $email, Password : $password'),
      ),
    );
  }

  void exitApp() {
      SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                'Adil Shahbaz',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
              CustomTextField(
                hintText: 'Your Full Name',
                icon: Icons.person,
                obscureText: false,
                icon_visibility: null,
                controller: nameController,
              ),
              CustomTextField(
                hintText: 'Your Email',
                icon: Icons.email_rounded,
                obscureText: false,
                icon_visibility: null,
                controller: emailController,
              ),
              CustomTextField(
                hintText: 'Password',
                icon: Icons.lock_rounded,
                obscureText: true,
                icon_visibility: Icons.visibility_rounded,
                controller: passwordController,
              ),
              CustomTextField(
                hintText: 'Confirm Password',
                icon: Icons.lock_rounded,
                obscureText: true,
                icon_visibility: Icons.visibility_rounded,
                controller: null,
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
    );
  }
}
