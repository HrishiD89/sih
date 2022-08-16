// import 'package:sih_project/main.dart';
// import 'package:sih_project/screens/homepage.dart';
// import 'package:sih_project/screens/signupscreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Loginscreen extends StatefulWidget {
//   const Loginscreen({Key? key}) : super(key: key);

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   // for suffix icon of eye in password textform field
//   void _togglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }

//   final emailcontroller = TextEditingController();
//   final passwordController = TextEditingController();

//   bool _isHidden = true;

//   @override
//   void dispose() {
//     emailcontroller.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Command to add bg image
//             // BgImage(),   (save th eeimage in pubspec.yaml in assets or build.gradle assets)
//             // Icon(
//             //   Icons.android,
//             //   size: 100,
//             // ),
//             // SizedBox(height: 75),
//             Text(
//               'Hello Again',
//               style: GoogleFonts.bebasNeue(
//                 color: Colors.teal,
//                 fontSize: 52,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Welcome back, you\'ve been missed!',
//               style: TextStyle(
//                 color: Colors.teal,
//                 fontSize: 18,
//               ),
//             ),

//             SizedBox(height: 30),

//             Form(
//                 child: Column(
//               children: [
//                 // email

//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   child: TextFormField(
//                       controller: emailcontroller,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.teal),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         hintText: 'Email',
//                         fillColor: Colors.grey[200],
//                         filled: true,
//                         prefixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (String value) {},
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return ("'Please enter email'");
//                         }
//                         if (!RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9+.-]+.[a-z]")
//                             .hasMatch(value)) {
//                           return ("Please enter a valid email");
//                         }
//                         return null;
//                       }),
//                 ),

//                 // password

//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   child: TextFormField(
//                       controller: passwordController,
//                       obscureText: _isHidden,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.teal),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           hintText: 'Password',
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                           prefixIcon: Icon(Icons.vpn_key_rounded),
//                           border: OutlineInputBorder(),
//                           suffix: InkWell(
//                             onTap: _togglePasswordView,
//                             child: Icon(_isHidden
//                                 ? Icons.visibility
//                                 : Icons.visibility_off),
//                           )),
//                       onChanged: (String value) {},
//                       validator: (value) {
//                         return value!.isEmpty ? 'Please enter Password' : null;
//                       }),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text('Forgot Password'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 35),

//                 // sign in button

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35),
//                   child: MaterialButton(
//                     minWidth: double.infinity,
//                     onPressed: signIn,
//                     child: Container(
//                       padding: EdgeInsets.all(18),
//                       decoration: BoxDecoration(
//                         color: Colors.teal,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 // sign up link

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Not a member?"),
//                     GestureDetector(
//                       //  linking the link to sign up page

//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Signupscreen()));
//                       },
//                       child: Text(
//                         ' Register now',
//                         style: TextStyle(
//                             color: Colors.blueAccent,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }

//   Future signIn() async {
//     showDialog(
//       context: context,
//       builder: (context) => Center(child: CircularProgressIndicator()),
//     );
//     try {
//       FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailcontroller.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//     print("signin successful");
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => HomePage()));
//     navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }
// }

// import 'dart:html';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_project/main.dart';
import 'package:sih_project/screens/ForgotPasswordPage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignupscreen;
  const LoginPage({
    Key? key,
    required this.showSignupscreen,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.android,
                ),
                //Hello again
                Text(
                  'Hello Again',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.teal,
                    fontSize: 52,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 50),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                      // prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignupscreen,
                      child: Text(
                        ' Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
