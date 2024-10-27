import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minggu4/screens/cart/cart.dart';
import 'package:minggu4/screens/mac/macbook.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> fotoCarousel = [
    "https://ibox.co.id/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Feraspacelink%2Fpmp%2Fproduction%2Fbanners%2Fimages%2FCvO3mb00rqkxRwTgyGp9Qx2gZ2KSLALT95lMzIRN.jpg&w=1920&q=55",
    "https://ibox.co.id/_next/image?url=https%3A%2F%2Fstorage.googleapis.com%2Feraspacelink%2Fpmp%2Fproduction%2Fbanners%2Fimages%2FjjBQ0PFwuE1ckodQHGFxrg8hpIKBkM3xfdm7CtuC.jpg&w=1920&q=55",
  ];

  final List<String> fotoTerbaru = [
    "https://www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=90//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=180//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=375//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=480//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=768//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1024//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1280//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1366//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1440//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1920//www.digimap.co.id/cdn/shop/files/ipad_pro_image.001.jpg?v=1721029528&width=1920",
    "https://www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=90//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=180//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=375//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=480//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=768//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1024//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1280//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1366//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1440//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1920//www.digimap.co.id/cdn/shop/files/Untitled_2.002.jpg?v=1721029396&width=1920",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vibe Gadget"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outline_rounded),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Vibe Gadget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Mac"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MacScreen()));
              },
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              title: const Text("Iphone"),
              onTap: () {},
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
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              title: const Text("Log Out"),
              leading: const Icon(Icons.logout),
              onTap: () {},
              trailing: const Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //   BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      // ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: fotoCarousel
                      .map((item) => SizedBox(
                            width: 400,
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(autoPlay: true, height: 200)),
              const Text(
                "Lihat semua produk dari Apple",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              CarouselSlider(
                  items: fotoTerbaru
                      .map((item) => SizedBox(
                            width: 400,
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(autoPlay: true, height: 200)),
              const Text(
                "Terbaru",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              CarouselSlider(
                  items: fotoTerbaru
                      .map((item) => Card(
                            elevation: 5,
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(autoPlay: true, height: 200)),
              const Text(
                "Keunggulan Digimap",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              CarouselSlider(
                  items: fotoCarousel
                      .map((item) => Container(
                            child: Text(item.toString()),
                          ))
                      .toList(),
                  options: CarouselOptions()),
            ],
          ),
        ),
      ),
    );
  }
}
