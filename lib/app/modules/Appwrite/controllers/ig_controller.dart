import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramController extends GetxController {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xFF000000))
    ..loadRequest(Uri.parse('https://www.instagram.com/informatika.umm/'));

  get isLoading => null;

  void loadInstagramUrl() {}
}
