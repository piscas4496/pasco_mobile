import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(),
            Text(
              controller.appName,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
