import 'package:flutter/material.dart';
import 'package:viceversa/routes/app_routes.dart';
import '../shared/product_card.dart';
import 'package:viceversa/data/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          Container(
            height: isPortrait ? 144 : screenHeight * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exclusive Offers",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Explore Now"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: isPortrait ? screenWidth * 0.28 : screenWidth * 0.15,
                    // Adjust image width dynamically
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image7.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 24),
          Text("Best Sellers",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
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
          const SizedBox(height: 24),
          Text("Exclusive Offers",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
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
                discountedPrice: 'LKR 3,499',
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
      ),
    );
  }
}
