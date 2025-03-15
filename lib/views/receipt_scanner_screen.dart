import 'package:edge_detection/controllers/receipt_scanner_controller.dart';
import 'package:flutter/material.dart';

class ReceiptScannerScreen extends StatefulWidget {
  const ReceiptScannerScreen({super.key});

  @override
  State<ReceiptScannerScreen> createState() => _ReceiptScannerScreenState();
}

class _ReceiptScannerScreenState extends State<ReceiptScannerScreen> {
  final ReceiptScannerController _receiptScannerController = ReceiptScannerController();

  @override
  void dispose() {
    _receiptScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receipt Scanner Edge Detection"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _receiptScannerController.scan();
              },
              child: Text("Scan Receipt"),
            ),
          ),
        ],
      ),
    );
  }
}
