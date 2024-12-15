import 'package:flutter/material.dart';
import 'package:minggu4/screens/mac/macbook_air.dart';

class MacScreen extends StatefulWidget {
  const MacScreen({super.key});

  @override
  State<MacScreen> createState() => _MacScreenState();
}

class _MacScreenState extends State<MacScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Vibe Gadget"),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(child: Text("All")),
              Tab(child: Text("Air")),
              Tab(child: Text("Pro")),
              Tab(child: Text("iMac")),
            ]),
          ),
          body: const TabBarView(children: [
            Text("Air"),
            MacbookAirScreen(),
            Text("Pro"),
            Text("iMac"),
          ])),
    );
  }
}
