import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:viceversa/views/shared/image_selector.dart';

import '../shared/color_selector.dart';
import '../shared/quantity_selector.dart';
import '../shared/size_selector.dart';

class ProductDetailScreen extends StatelessWidget {
  final product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String productName = product['name']!;
    final String productDescription = product['description']!;
    final double productPrice = product['price']!;
    final String productImage = product['imageUrl']!;
    final String productCategory = product['category']!;
    final String productGender = product['gender'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$productGender | $productCategory'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
                height: 288,
                width: double.infinity,
                color: Theme.of(context).colorScheme.secondary,
                child: Image.network(productImage)),
            Padding(padding: EdgeInsets.only(left: 16, top: 8),
                child: ImageSelector(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    productDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8),
                  Text("Color", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                  SizedBox(height: 4),
                  ColorSelector(),
                  SizedBox(height: 8),
                  Text("Size", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                  SizedBox(height: 4),
                  SizeSelector(),
                  SizedBox(height: 8),
                  Text("Quantity", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                  SizedBox(height: 4),
                  QuantitySelector(),
                ],
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
            color: Colors.white, // or your desired color
          ),
          child: BottomAppBar(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'LKR $productPrice',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
