import 'package:flutter/material.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  @override
  _DeliveryDetailsScreenState createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  String? selectedAddress;
  String? selectedShippingMethod;
  List<String> savedAddresses = [
    '123 Main Street, City XYZ, 12345',
    '456 Market Road, City ABC, 67890',
  ];

  List<Map<String, dynamic>> shippingMethods = [
    {'name': 'Standard', 'details': '5-7 Business Days', 'price': 'LKR 199'},
    {'name': 'Express', 'details': '2-3 Business Days', 'price': 'LKR 399'},
  ];

  String currentEmail = "pranavans2003@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery",
          style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 24.0),

          Text(
            'Account',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),

          Text(currentEmail, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 16.0),

          Text(
            'Ship To',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),

          DropdownButtonFormField<String>(
            value: selectedAddress,
            hint: Text('Select or add an address'),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: savedAddresses.map((address) {
              return DropdownMenuItem<String>(
                value: address,
                child: Text(address),
              );
            }
            ).toList(),
            onChanged: (String? value) {
                setState(() {
                  selectedAddress = value;
                });
            },
          ),
          SizedBox(height: 16.0),

          Text(
            'Shipping Method',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: selectedShippingMethod,
            hint: Text('Select shipping method'),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            isExpanded: true,
            isDense: false,
            items: shippingMethods.map((method) {
              return DropdownMenuItem<String>(
                value: method['name'],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(method['name']),
                        Text(
                          method['details'],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    ),
                    Text(method['price']),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedShippingMethod = value;
              });
            },
          ),

          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  // Handle "Add New Address" option
  void _addNewAddress() {
    setState(() {
      selectedAddress = 'add_new';
    });
  }
}
