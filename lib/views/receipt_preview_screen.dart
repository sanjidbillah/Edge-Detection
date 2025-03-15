import 'dart:io';

import 'package:flutter/material.dart';

class ReceiptPreviewScreen extends StatelessWidget {
  final List<String> documents;
  const ReceiptPreviewScreen({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receipt Preview"),
      ),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (_, index) {
          final item = documents[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Document :$index",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Image.file(File(item)),
            ],
          );
        },
      ),
    );
  }
}
