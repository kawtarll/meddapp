import 'package:flutter/material.dart';

class QRScanBanner extends StatelessWidget {
  const QRScanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Scannez QR et suivez vos médecins",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: null, // Remplacez par l'action réelle
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                  ),
                  child: Text("Scanner maintenant"),
                ),
              ],
            ),
          ),
          const Icon(Icons.qr_code, size: 50, color: Colors.blue),
        ],
      ),
    );
  }
}