
class Product{
  //properties
  int id;
  String name;
  double price;
  String image;
  String get imageUrl => 'https://firtman.github.io/coffeemasters/api/images/$image';
//constructor
  Product({required this.id, required this.name, required this.price, required this.image});

 factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      image: json['image'] as String,
    );
  }

}

class Category{
  String name;
  List<Product> products;

  Category({required this.name, required this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    var productJson = json['products'] as Iterable<dynamic>;
    var products= productJson.map((p) => Product.fromJson(p)).toList();
    return Category(
      name: json['name'] as String,
      products: products,
    );
  }
}

class ItemInCart{
  Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}