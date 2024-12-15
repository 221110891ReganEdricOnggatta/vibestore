class IphoneModel {
  final String name;
  final String image;
  final int price;
  int qty;

  IphoneModel({
    required this.name,
    required this.qty,
    required this.image,
    required this.price,
  });
}

final List<IphoneModel> iphone11Products = [
  IphoneModel(
    name: "iPhone 11 Black",
    image: "assets/images/iphone/11_series/iphone_11_black.jpg",
    price: 7999999,
    qty: 10,
  ),
  IphoneModel(
    name: "iPhone 11 Green",
    image: "assets/images/iphone/11_series/iphone_11_green.jpg",
    price: 7999999,
    qty: 1,
  ),
  IphoneModel(
    name: "iPhone 11 Purple",
    image: "assets/images/iphone/11_series/iphone_11_purple.jpg",
    price: 7999999,
    qty: 4,
  ),
  IphoneModel(
    name: "iPhone 11 Red",
    image: "assets/images/iphone/11_series/iphone_11_red.jpg",
    price: 7999999,
    qty: 7,
  ),
];

final List<IphoneModel> iphone12Products = [
  IphoneModel(
    name: "iPhone 12 Black",
    image: "assets/images/iphone/12_series/iphone_12_black.jpg",
    price: 7999999,
    qty: 12,
  ),
  IphoneModel(
    name: "iPhone 12 Blue",
    image: "assets/images/iphone/12_series/iphone_12_blue.jpg",
    price: 7999999,
    qty: 8,
  ),
  IphoneModel(
    name: "iPhone 12 Green",
    image: "assets/images/iphone/12_series/iphone_12_green.jpg",
    price: 7999999,
    qty: 3,
  ),
  IphoneModel(
    name: "iPhone 12 White",
    image: "assets/images/iphone/12_series/iphone_12_white.jpg",
    price: 7999999,
    qty: 6,
  ),
];
