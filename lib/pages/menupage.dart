import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataManager.getMenu(), 
      builder: ((context, snapshot) {
        if(snapshot.hasData){
         var categories = snapshot.data!;
         return ListView.builder(
            itemCount: categories.length,

            itemBuilder: ((context, index) {           
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(categories[index].name),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: categories[index].products.length,
                  itemBuilder: (itemBuilder, productIndex) {
                    var product = categories[index].products[productIndex];
                  return ProductItem(
                    product: product,
                    onAdd: (product) {
                      dataManager.cartAdd(product);
                                                               
                    },
                  );
                },)
              ],
            );
           }));
           }
            


        else{
          if(snapshot.hasError){
            return Center(child: Text("There was an error: ${snapshot.error}"));
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        }
        
       

      }
      
      ),);
   

  }
   
    } 

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  
  const ProductItem({super.key, required this.product,required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child:  Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
           // Image.network(product.imageUrl, height: 100, width: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\$${product.price.toStringAsFixed(2)}'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(onPressed: (){
                    // Add product to cart
                    onAdd(product);
                  }, child: const Text("Add")),
                )
              ],
            ),
          ],
        )),
    );
  }
}