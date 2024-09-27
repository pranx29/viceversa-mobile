import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../shared/category_card.dart';
import '../shared/product_card.dart';

import 'package:viceversa/data/product.dart';

class MenScreen extends StatelessWidget {
  MenScreen({super.key});

  final items = [
    {'icon': 'assets/icons/all-clothings.svg', 'label': 'All'},
    {'icon': 'assets/icons/tshirt.svg', 'label': 'T Shirt'},
    {'icon': 'assets/icons/shirt.svg', 'label': 'Shirt'},
    {'icon': 'assets/icons/pant.svg', 'label': 'Pants'},
    {'icon': 'assets/icons/short.svg', 'label': 'Shorts'},
    {'icon': 'assets/icons/hoodie.svg', 'label': 'Hoodie'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    int crossAxisCount = (screenWidth ~/ 180);
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 8),
        CategoryCardList(categories: items,),
        SizedBox(
          height: 24,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              imageUrl: product['imageUrl']!,
              name: product['name']!.toUpperCase(),
              price: product['price']!,
              onFavoritePressed: () {
                print('${product['name']} favorited!');
              },
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.productDetail,
                    arguments: product);
                print('${product['name']} tapped!');
              },
            );
          },
          shrinkWrap: true,
          physics: const ScrollPhysics(),
        ),
      ],
    ));
  }
}
