import 'package:flutter/material.dart';
import 'package:minggu4/database/database.dart';
import 'package:minggu4/model/customer.dart';
import 'package:minggu4/screens/login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  final DatabaseStore _databaseStore = DatabaseStore();

  Future<bool> _insertCustomer() async {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmationController.text.isNotEmpty) {
      if (_passwordController.text == _passwordConfirmationController.text) {
        Customer customer = Customer(
            email: _emailController.text,
            nama: _usernameController.text,
            password: _passwordController.text);
        debugPrint("Customer map: ${customer.toMap()}");
        try {
          int id = await _databaseStore.insert(customer.toMap());
          debugPrint("Customer inserted with id : $id");
          return id > 0;
        } catch (e) {
          debugPrint("Error inserting customer : $e");
          return false;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password and Password Confirmation do not match!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all the fields!")));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            const SizedBox(height: 20),
            const Text("username"),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "your email",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("email"),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "your email",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("password"),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "your email",
                  hintStyle: TextStyle(color: Colors.grey)),
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("password confirmation"),
            TextField(
              controller: _passwordConfirmationController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password confirmation",
                  hintStyle: TextStyle(color: Colors.grey)),
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    bool success = await _insertCustomer();
                    if (success) {
                      // Only navigate if the registration was successful
                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Color(0xFF253732), fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
