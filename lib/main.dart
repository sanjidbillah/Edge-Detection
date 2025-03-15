import 'package:edge_detection/utils/navigation_service.dart';
import 'package:flutter/material.dart';

import 'views/receipt_scanner_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService.key,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ReceiptScannerScreen(),
    );
  }
}
