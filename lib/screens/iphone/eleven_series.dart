import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minggu4/model/iphone_model.dart';
import 'package:minggu4/screens/iphone/detail_iphone.dart';

class ElevenSeriesScreen extends StatefulWidget {
  const ElevenSeriesScreen({super.key});

  @override
  State<ElevenSeriesScreen> createState() => _ElevenSeriesScreenState();
}

class _ElevenSeriesScreenState extends State<ElevenSeriesScreen> {
  void _updateStock(IphoneModel product, int qtyToUpdate) {
    setState(() {
      product.qty -= qtyToUpdate; 
    });
  }

  @override
  Widget build(BuildContext context) {
    String formatHarga(int number) {
      final formatting = NumberFormat.currency(
          locale: "id_ID", symbol: "Rp ", decimalDigits: 0);
      return formatting.format(number);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Iphone 11 Series",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    DefaultTabController.of(context).animateTo(1);
                  },
                  child: const Row(
                    children: [
                      Text("Show Collections"),
                      Icon(Icons.arrow_right)
                    ],
                  ))
            ],
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 1,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: iphone11Products.length,
              itemBuilder: (context, index) {
                final product = iphone11Products[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              formatHarga(product.price),
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Stock: ${product.qty}", // Tampilkan stok terbaru
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                showProductDetails(
                                  context,
                                  product,
                                  onUpdateStock: _updateStock,
                                );
                              },
                              child: const Text(
                                "Detail",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
