import 'package:flutter/material.dart';
import 'package:viceversa/views/shared/quantity_selector.dart';

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const OrderItem({Key? key, required this.item}) : super(key: key);

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
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(item['imageUrl'],
                  fit: BoxFit.fill),
            ),
            SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'].toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('${item['color']['name']} | '),
                      Text('${item['size']} | '),
                      Text('${item['quantity']} Units'),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              item['price'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
