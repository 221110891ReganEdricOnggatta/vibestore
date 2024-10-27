import 'package:flutter/material.dart';

class MacScreen extends StatefulWidget {
  const MacScreen({super.key});

  @override
  State<MacScreen> createState() => _MacScreenState();
}

class _MacScreenState extends State<MacScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vibe Gadget"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [Text("Macbook Air Series")],
            )
          ],
        ),
      ),
    );
  }
}
