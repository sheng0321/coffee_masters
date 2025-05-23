import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final DataManager dataManager;
  const OrderPage({super.key, required this.dataManager});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {

   onDelete(Product product) {
    setState(() {
      widget.dataManager.cartRemove(product);
    });
     
    } 
    if(widget.dataManager.cart.isEmpty){
      return const Center(child: Text('No items in cart'));
    }else{
       return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.dataManager.cart.length,
          itemBuilder: (context, index) {
            var item = widget.dataManager.cart[index];
            return OrderItem(item: item, onRemove: onDelete,);
          },
        ),
        Text('Total: \$${widget.dataManager.cartTotal}'),
      ],
    );

    }
   
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function onRemove;
  const OrderItem({super.key, required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child:Padding(padding: const EdgeInsets.only(left: 8.0),
            child:Text('${item.quantity} x '),
            ),

          ),
          Expanded(
            flex:30,
            child:Padding(padding: const EdgeInsets.all(8),
            child:Text('${item.product.name}'),
            ),

          ),
          Expanded(
            flex: 20,
            child: Text("\$"+(item.product.price*item.quantity).toString()),),
          Expanded(
            flex: 20,
            child: IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: (){
                onRemove(item.product);
              }, icon: const Icon(Icons.delete),),)
          //leading: Image.network(item.product.imageUrl),
          
        ],
      )
      ), ); 
    

  }
}