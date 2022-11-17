import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    for (var prod in entries) {
      newTotal = newTotal + (prod.price * prod.quantity);
    }
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    var newEntries = entries;
    var prodto = newEntries.firstWhere((prod) => prod.id == id);
    var index = newEntries.indexOf(prodto);
    newEntries[index].quantity += 1;
    entries[index] = newEntries[index];
    entries.replaceRange(0, newEntries.length, newEntries);
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    var newEntries = entries;
    var prodto = newEntries.firstWhere((prod) => prod.id == id);
    var index = newEntries.indexOf(prodto);
    if (newEntries[index].quantity > 0) {
      entries[index].quantity -= 1;
      entries[index] = newEntries[index];
      entries.replaceRange(0, newEntries.length, newEntries);
    }
    calcularTotal();
  }
}
