import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minggu4/model/localizationhelper.dart';
import 'package:minggu4/model/product.dart';
import 'dart:convert';
import 'package:minggu4/screens/cart/cart.dart';
import 'package:minggu4/screens/iphone/iphone.dart';
import 'package:minggu4/screens/mac/macbook.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAdmin = false;
  final List<String> fotoCarousel = [
    "https://ibox.co.id/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Feraspacelink%2Fpmp%2Fproduction%2Fbanners%2Fimages%2FCvO3mb00rqkxRwTgyGp9Qx2gZ2KSLALT95lMzIRN.jpg&w=1920&q=55",
    "https://ibox.co.id/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Feraspacelink%2Fpmp%2Fproduction%2Fbanners%2Fimages%2FjjBQ0PFwuE1ckodQHGFxrg8hpIKBkM3xfdm7CtuC.jpg&w=1920&q=55",
  ];

  List<Product> products = [];

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://example.com/products.json'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          products = jsonData.map((item) => Product.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      debugPrint('Error fetching products: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationHelper.translate("appTitle")),
        centerTitle: true,
        actions: [
          Semantics(
            label: "Keranjang belanja",
            hint: "Ketuk untuk melihat keranjang belanja Anda",
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      drawer: Semantics(
        label: "Menu Navigasi",
        hint: "Klik dan layar akan ke kanan untuk membuka menu navigasi",
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  LocalizationHelper.translate("appTitle"),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(LocalizationHelper.translate("mac")),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MacScreen()));
                },
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                title: const Text("Iphone"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IphoneScreen()));
                },
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                title: const Text("Ipad"),
                onTap: () {},
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                title: const Text("Airpods"),
                onTap: () {},
                trailing: const Icon(Icons.arrow_right),
              ),
              ListTile(
                title: const Text("Apple Watch"),
                onTap: () {},
                trailing: const Icon(Icons.arrow_right),
              ),
              const SizedBox(height: 30),
              const Divider(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Semantics(
                  label: "Pilihan bahasa",
                  hint: "Ketuk untuk mengganti bahasa aplikasi",
                  child: DropdownButton<String>(
                    value: LocalizationHelper.currentLanguage,
                    items: const [
                      DropdownMenuItem(
                        child: Text("English"),
                        value: "en",
                      ),
                      DropdownMenuItem(
                        child: Text("Indonesia"),
                        value: "id",
                      ),
                    ],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          LocalizationHelper.setLanguage(newValue);
                        });
                      }
                    },
                  ),
                ),
              ),
              ListTile(
                title: Semantics(
                    label: "Keluar",
                    hint: "Ketuk untuk keluar dari aplikasi",
                    child: Text(LocalizationHelper.translate("logout"))),
                leading: const Icon(Icons.logout),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(LocalizationHelper.translate("logout")),
                          content: Text(
                              LocalizationHelper.translate("logoutConfirm")),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                    LocalizationHelper.translate("cancel"))),
                            TextButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                },
                                child: Text(
                                    LocalizationHelper.translate("logout"))),
                          ],
                        );
                      });
                },
                trailing: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CarouselSlider(
                items: fotoCarousel
                    .map((item) => Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(autoPlay: true, height: 200),
              ),
              const SizedBox(height: 20),
              Text(
                LocalizationHelper.translate("productsTitle"),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: products
                    .map((product) => Center(
                          child: Column(
                            children: [
                              Image.network(product.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8),
                              const SizedBox(height: 10),
                              Text(
                                product.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('\$${product.price.toStringAsFixed(2)}'),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(autoPlay: true, height: 250),
              ),
              const SizedBox(height: 20),
              Text(
                LocalizationHelper.translate("advantagesTitle"),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: fotoCarousel
                    .map((item) => Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            item.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(autoPlay: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
