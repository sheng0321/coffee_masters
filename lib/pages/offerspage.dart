import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
         Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
        Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
         Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
        Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
         Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
        Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
         Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
        Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
         Offer(title: "My great offer ever", description: 'Buy 1, get 1 free'),
    
      ],
    );
  }
}

class Offer extends StatelessWidget {

  //properties
  final String title;
  final String description;

const Offer({super.key,
    required this.title,
    required this.description,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(image: const DecorationImage(image: AssetImage("images/background.png"),fit: BoxFit.cover) ,),
            child: Column(
            
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Text(title,style: Theme.of(context).textTheme.headlineMedium,))),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                    color: Colors.amber.shade50,
                    child: Text(description, style: Theme.of(context).textTheme.headlineSmall,))),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}