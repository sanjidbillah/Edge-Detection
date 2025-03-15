import 'package:edge_detection/utils/navigation_service.dart';
import 'package:flutter/material.dart';

showSnacBar({String? msg}) {
  final snackBar = SnackBar(content: Text(msg ?? "Something went wrong! Try again"));

  ScaffoldMessenger.of(NavigationService.currentContext).showSnackBar(snackBar);
}
