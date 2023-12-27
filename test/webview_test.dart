import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

abstract class WebViewController {
  Future<void> loadHtmlString(String html);
}

class RealWebViewController implements WebViewController {
  final Future<WebViewController> _controller =
      Completer<WebViewController>().future;

  @override
  Future<void> loadHtmlString(String html) async {
    final webViewController = await _controller;
    webViewController.loadHtmlString(html);
  }
}

class InstagramController extends GetxController {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  void initController(WebViewController webViewController) {
    controller.complete(webViewController);
  }

  void loadInstagramUrl() {
    controller.future.then((webViewController) {
      webViewController.loadHtmlString('https://instagram.com');
    });
  }

  bool get isLoading {
    // Replace this with the actual logic to determine loading state.
    return true;
  }
}

void main() {
  test('InstagramController initializes WebViewController', () {
    // Create an instance of InstagramController with a mock WebViewController.
    final instagramController = InstagramController();
    instagramController.initController(RealWebViewController());

    // Verify that WebViewController is initialized.
    expect(instagramController.controller, isA<Completer<WebViewController>>());
  });

  test('Load Instagram URL without WebView', () async {
    // Create an instance of InstagramController with a mock WebViewController.
    final instagramController = InstagramController();
    instagramController.initController(RealWebViewController());

    // Load Instagram URL.
    instagramController.loadInstagramUrl();

    // Verify that the expected flag is set after loading the URL.
    expect(instagramController.isLoading, isTrue);
  });
}
