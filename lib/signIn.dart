import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threenav/main.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.uname, required this.pass});

  final String uname;
  final String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          'https://www.firstinspires.org/sites/default/files/uploads/resource_library/brand/thumbnails/FIRST-H.png',
          width: 200,
          height: 200,
        ),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsetsGeometry.all(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In', style: GoogleFonts.roboto(fontSize: 24)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SignInForm()],
          ),
          Padding(padding: EdgeInsetsGeometry.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  final formState = signInFormKey.currentState;
                  if (formState != null &&
                      uname == formState.usernameController.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (newContext) => MainApp(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final GlobalKey<SignInFormState> signInFormKey = GlobalKey<SignInFormState>();

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsetsGeometry.all(20)),
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  Padding(padding: EdgeInsetsGeometry.all(10)),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.all(10)),
          ],
        ),
      ),
    );
  }
}
