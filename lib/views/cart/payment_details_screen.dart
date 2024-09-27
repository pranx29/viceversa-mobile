import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viceversa/views/shared/custom_form_text_field.dart';

class PaymentDetailsScreen extends StatefulWidget {
  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  String? selectedPaymentMethod = 'Visa';
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 24.0),

          Text(
            'Select Payment Method',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          // Payment method icons
          Row(
            children: [
              _buildPaymentMethodOption("Visa", "assets/icons/visa.svg"),
              SizedBox(width: 16.0),
              _buildPaymentMethodOption(
                  "Mastercard", "assets/icons/mastercard.svg"),
            ],
          ),
          SizedBox(height: 16.0),

          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name on Card Input
                CustomFormTextField(controller: nameController, labelText: 'Name on Card', keyboardType: TextInputType.name,),
                SizedBox(height: 16.0),
                CustomFormTextField(controller: cardNumberController, labelText: 'Card Number', keyboardType: TextInputType.number,),
                SizedBox(height: 16.0),
                CustomFormTextField(controller: expiryDateController, labelText: 'Expiry Date (MM/YY)', keyboardType: TextInputType.datetime,),
                SizedBox(height: 16.0),
                CustomFormTextField(controller: expiryDateController, labelText: 'CVV', keyboardType: TextInputType.number,),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption(String name, String iconPath) {
    return Row(
      children: [
        Radio<String>(
          value: name,
          groupValue: selectedPaymentMethod,
          onChanged: (String? value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
        ),
        SvgPicture.asset(
          iconPath,
          width: 40,
          height: 40,
        ),
        SizedBox(width: 8.0),
        Text(name),
      ],
    );
  }
}
