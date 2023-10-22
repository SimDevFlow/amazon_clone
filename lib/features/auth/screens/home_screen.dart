import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Amazone clone'),),
        body: Column(
          children: [
             const Center(
              child: Text('Hello World'),
            ),
            ElevatedButton(onPressed: (){
              Get.toNamed('auth');
            }, child: const Text('Click'))
          ],
        ),
      );
  }
}