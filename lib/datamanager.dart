import 'dart:convert';

import 'package:coffee_masters/datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart=[];

fetchMenu () async {
  // const url = 'https://firtman.github.io/coffemasters/api/menu.json';
  // var response = await http.get(Uri.parse(url));
  // if (response.statusCode == 200) {
  //   var body = response.body;
  //   _menu = [];
  //   var decodeData = jsonDecode(body) as List<dynamic>;
  //   for (var json in decodeData) {
  //     var category = Category.fromJson(json);
  //     _menu!.add(category);
  //   }
  // } else {
    //throw Exception('Failed to load menu');
    //mock data
    _menu = [
      Category(

        name: "Coffee",
        products: [
          Product(
            id: 1,
            name: "Espresso",       
            price: 2.5,
            image: 'black_coffee.png',           
          ),
          Product(
            id: 2,
            name: "Cappuccino",
            price: 3.0,
            image: 'black_coffee.png',
          ),
          
        ],
      ),
      Category(
        name: "Tea",
        products: [
          Product(
            id: 3,
            name: "Green Tea",
            price: 2.0,
            image: 'black_coffee.png',
          ),
          Product(
            id: 4,
            name: "Black Tea",
            price: 2.5,
            image: 'black_coffee.png',
          ),
        ],
      ),
    ];
 // }
}

Future<List<Category>> getMenu()async{
  if (_menu == null) {
    // Fetch the menu from the API or local storage
    await fetchMenu();
  }
  return _menu!;
}

fetchProducts(){}



 cartAdd(Product p){
  bool found = false;
  for (var item in cart) {
    if (item.product.id == p.id) {
      item.quantity++;
      found = true;
      break;
    }
  }
  if (!found) {
    // If the product is not found in the cart, add it
    ItemInCart item = ItemInCart(product: p, quantity: 1);
    cart.add(item);
  }
 }

cartRemove(Product p){
    cart.removeWhere((item) => item.product.id == p.id);
    }
cartClear(){
    cart.clear();}
double get cartTotal {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;}
  
  }
