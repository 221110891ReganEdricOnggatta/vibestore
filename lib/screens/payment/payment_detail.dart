import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({super.key});

  Future<void> handleLocationPermission(BuildContext context) async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Location permission granted. Proceeding with COD."),
        ),
      );
      Navigator.pop(context);
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Location permission denied. COD requires location access."),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Permission Required"),
            content: const Text(
                "Location permission is required to use COD. Please enable it in app settings."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
                child: const Text("Open Settings"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.delivery_dining, color: Colors.green),
              title: const Text("Cash on Delivery (COD)"),
              onTap: () {
                handleLocationPermission(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.qr_code,
              ),
              title: const Text("QR Code"),
              onTap: () {
                handleLocationPermission(context);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
