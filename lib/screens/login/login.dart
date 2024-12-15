import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minggu4/screen.dart';
import 'package:minggu4/screens/login/register.dart';
import 'package:minggu4/screens/login/register2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visibleField = false;
  bool _isloading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future login() async {
    setState(() {
      _isloading = true;
    });
    if (_emailcontroller.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      setState(() {
        _isloading = false;
      });
      return;
    }

    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: _emailcontroller.text, password: _passwordController.text);

      // Ambil data pengguna dari Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .get();

      if (userDoc.exists) {
        print("User Data: ${userDoc.data()}");
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Screen()));
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "user-not-found") {
        message = "No user found for that email.";
      } else if (e.code == "wrong-password") {
        message = "The password provided is wrong for that email.";
      } else if (e.code == "invalid-email") {
        message = "That email is invalid.";
      } else if (e.code == "network-request-failed") {
        message = "No internet connection";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to,",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Vibe Store",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 240),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Please login into your account!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            hintText: "example@gmail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        // Password Field
                        TextField(
                          controller: _passwordController,
                          obscureText: !_visibleField,
                          decoration: InputDecoration(
                              hintText: "Your password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _visibleField = !_visibleField;
                                    });
                                  },
                                  icon: Icon(
                                    _visibleField
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ))),
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                            onPressed: _isloading ? null : login,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: _isloading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("Login")),
                        const SizedBox(height: 10),
                        // Register Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Register2Screen()));
                              },
                              child: const Text("Register Here"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
