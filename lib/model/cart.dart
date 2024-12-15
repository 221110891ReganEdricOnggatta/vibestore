import 'package:minggu4/model/iphone_model.dart';

class CartItem {
  final IphoneModel product;
  int qty;

  CartItem({required this.product, this.qty = 1});
}

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(IphoneModel product, {int qty = 1}) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.product.name == product.name,
      orElse: () => CartItem(product: product, qty: 0),
    );

    if (existingItem.qty > 0) {
      if (existingItem.qty + qty <= product.qty) {
        existingItem.qty += qty;
        product.qty -= qty; // Update stok
      } else {
        throw Exception("Jumlah melebihi stok produk");
      }
    } else {
      if (qty <= product.qty) {
        _cartItems.add(CartItem(product: product, qty: qty));
        product.qty -= qty; // Update stok
      } else {
        throw Exception("Jumlah melebihi stok produk");
      }
    }
  }

  void updateCartItemQty(CartItem item, int qty) {
    final difference = qty - item.qty;
    if (difference > 0 && item.product.qty >= difference) {
      item.qty = qty;
      item.product.qty -= difference;
    } else if (difference < 0) {
      item.qty = qty;
      item.product.qty += -difference;
    } else {
      throw Exception("Jumlah tidak valid");
    }
  }

  void removeFromCart(CartItem item) {
    item.product.qty += item.qty; // Kembalikan stok
    _cartItems.remove(item);
  }
}
