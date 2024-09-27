import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final double height;
  final double width;

  QuantitySelector({
    Key? key,
    this.initialQuantity = 1,
    this.height = 40.0,
    this.width = 120.0,
  }) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      height: widget.height,
      width: widget.width,
      child: Row(
        children: [
          // Decrement button
          Expanded(
            child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: _decrementQuantity,
              padding: EdgeInsets.zero,
              iconSize: widget.height * 0.5,
            ),
          ),

          // Quantity
          Container(
            width: widget.width * 0.4,
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Increment button
          Expanded(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: _incrementQuantity,
              padding: EdgeInsets.zero,
              iconSize: widget.height * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
