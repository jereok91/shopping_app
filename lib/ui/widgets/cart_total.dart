import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final ShoppingController shoppingController = Get.find<ShoppingController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Obx(() => Text('Total: ${shoppingController.total.value} usd',
              style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400)))),
    );
  }
}
