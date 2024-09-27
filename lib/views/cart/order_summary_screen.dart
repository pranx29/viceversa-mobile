import 'package:flutter/material.dart';
import 'package:viceversa/views/shared/order_item.dart';
import '../../data/order.dart';

class OrderSummaryScreen extends StatelessWidget {

  final String deliveryAddress = '123, Main Street, Colombo 7';
  final String paymentMethod = 'Visa Card';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary",
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 24.0),

          Text(
            'Delivery Address',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(deliveryAddress),
          SizedBox(height: 16.0),

          Text(
            'Payment Method',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(paymentMethod),
          SizedBox(height: 16.0),

          Text(
            'Order Items',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                return OrderItem(item: orderItems[index]);
              },
            ),
          ),
          SizedBox(height: 16.0),

          // Pricing Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal'),
              Text('LKR 14,997'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping - Express'),
              Text('LKR 399'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'LKR 15,396',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}