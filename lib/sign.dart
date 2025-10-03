import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signIn.dart';

void main() {
  runApp(const Sign());
}

class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.network(
            'https://www.firstinspires.org/sites/default/files/uploads/resource_library/brand/thumbnails/FIRST-H.png',
            width: 200,
            height: 200,
          ),
        ),
        body: const SignUpScreen(),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(30)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Sign Up', style: GoogleFonts.roboto(fontSize: 24))],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SignUpForm()],
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () {
                // This will be handled by the form
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignUp(BuildContext context) {
    final String email = _emailController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Basic validation
    if (email.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (newContext) => SignIn(uname: username, pass: password),
        ),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  ElevatedButton(
                    onPressed: () => _handleSignUp(context),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
