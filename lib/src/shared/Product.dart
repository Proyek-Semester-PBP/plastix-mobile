class Product {
  String name, price, image;
  bool userLiked;
  double discount;

  Product(
      {required this.name,
      required this.price,
      required this.discount,
      required this.image,
      required this.userLiked});
}
