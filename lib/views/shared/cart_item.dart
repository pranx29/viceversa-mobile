import 'package:flutter/material.dart';
import 'package:viceversa/views/shared/quantity_selector.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const CartItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(item['imageUrl'],
                  fit: BoxFit.fill), // Use product image from assets
            ),
            SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'].toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Size: ${item['size']}'),
                  Text('Color: ${item['color']['name']}'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['price'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      QuantitySelector(initialQuantity: item['quantity'],
                      width: 96, height: 32,),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
              onPressed: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
