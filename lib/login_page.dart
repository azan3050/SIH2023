// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const LoginPage({super.key, required this.showSignUpPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _validate = false;
  bool _pvalidate = false;

  Future signIn() async {
    setState(() {
      _emailController.text.isEmpty ? _validate = true : _validate = false;
      _passwordController.text.isEmpty ? _pvalidate = true : _pvalidate = false;
    });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.fill,
                )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Icon(
                    Icons.lock_person,
                    size: 140,
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Text(
                    'Hello There!',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: Text('Welcome Back, We Missed You',
                        style: GoogleFonts.eduNswActFoundation(
                          fontSize: 22,
                        )),
                  ),
                  const SizedBox(height: 25),

                  //mail box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white54,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 0.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              errorText:
                              _validate ? 'Email box is empty' : null,
                              enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  //password box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              errorText: _pvalidate ? 'No Password' : null,
                              enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: InputBorder.none,
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //ForgotPassword
                  Padding(
                    padding: const EdgeInsets.only(left: 220.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ForgotPasswordPage();
                          }),
                        );
                      },
                      child: const Center(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(78, 62, 94, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // SignUp Now option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Do not have a account? '),
                      GestureDetector(
                        onTap: widget.showSignUpPage,
                        child: const Text(
                          'Sign Up ',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text('now'),
                    ],
                  ),

                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
