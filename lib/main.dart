import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
import 'sign.dart';
import 'signIn.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        // Wrap with Builder
        builder: (newContext) => Scaffold(
          appBar: AppBar(
            title: Image.network(
              'https://www.firstinspires.org/sites/default/files/uploads/resource_library/brand/thumbnails/FIRST-H.png',
              width: 200,
              height: 200,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.push(
                          newContext,
                          MaterialPageRoute<void>(
                            builder: (context) => const SignIn(
                              uname: "NoEntry",
                              pass: "Iwarnedyou",
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsetsGeometry.all(10)),
                Text(
                  'or',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(padding: EdgeInsetsGeometry.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: () {
                        Navigator.push(
                          newContext,
                          MaterialPageRoute<void>(
                            builder: (context) => const Sign(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Register',
              ),
            ],
            //currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 237, 27, 36),
            unselectedItemColor: const Color.fromARGB(255, 0, 101, 179),
            //onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
