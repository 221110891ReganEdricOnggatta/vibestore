import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String customerName = "no name";

  @override
  void initState() {
    super.initState();
    _loadCustomer();
  }

  Future<void> _loadCustomer() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString("customerName");
    if (name != null && name.isNotEmpty) {
      setState(() {
        customerName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(),
              title: Text(customerName),
            ),
            const Divider(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Pesanan Saya"), Text("Lihat History")],
            ),
            const Divider(
              height: 20,
            ),
            const Text("Saldo Anda"),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [Icon(Icons.money), Text("   Rp 120.000")],
            ),
            const Divider(
              height: 20,
            ),
            const Text("Bantuan"),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(Icons.contact_support),
                Text("  Chat dengan VibeStore")
              ],
            )
          ],
        ),
      ),
    );
  }
}
