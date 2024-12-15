import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minggu4/model/cart.dart';
import 'package:minggu4/screens/payment/payment_detail.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartManager cartManager = CartManager();

  String formatHarga(int number) {
    final formatting =
        NumberFormat.currency(locale: "id_ID", symbol: "Rp ", decimalDigits: 0);
    return formatting.format(number);
  }

  int calculateTotalPrice() {
    return cartManager.cartItems.fold(0, (total, item) {
      return total + (item.product.price * item.qty);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = cartManager.cartItems;
    final totalPrice = calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text("Your cart is empty"),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item.product.image),
                        ),
                        title: Text(item.product.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${formatHarga(item.product.price)}"),
                            Text("Stok: ${item.product.qty}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (item.qty > 1) {
                                  setState(() {
                                    try {
                                      cartManager.updateCartItemQty(
                                          item, item.qty - 1);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e.toString()),
                                        ),
                                      );
                                    }
                                  });
                                }
                                ;
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text("${item.qty}"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  try {
                                    cartManager.updateCartItemQty(
                                        item, item.qty + 1);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.toString()),
                                      ),
                                    );
                                  }
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  cartManager.removeFromCart(item);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total: ${formatHarga(totalPrice)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (cartItems.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Keranjang kosong!"),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentDetailScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
