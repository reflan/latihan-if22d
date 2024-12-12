import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DosenAddView extends GetView {
  const DosenAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DosenAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DosenAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
