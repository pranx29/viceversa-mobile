import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:viceversa/views/cart/payment_details_screen.dart';

import '../../routes/app_routes.dart';
import 'delivery_details_screen.dart';
import 'order_summary_screen.dart';

class CheckoutProcess extends StatefulWidget {
  @override
  _CheckoutProcessState createState() => _CheckoutProcessState();
}

class _CheckoutProcessState extends State<CheckoutProcess> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Function to navigate to the next page
  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressBar(
              maxSteps: 3,
              currentStep: _currentPage,
              semanticsLabel: 'Checkout Progress',
              semanticsValue: '${_currentPage + 1} of 3',
              progressType: LinearProgressBar.progressTypeDots,
              dotsSpacing: EdgeInsets.symmetric(horizontal: 16.0),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              progressColor: Theme.of(context).colorScheme.onSecondary,
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                DeliveryDetailsScreen(),
                PaymentDetailsScreen(),
                OrderSummaryScreen(),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
            onPressed: _currentPage == 2 ? _confirmOrder : _goToNextPage,
            child: Text(_currentPage == 2 ? 'Confirm Order' : 'Continue'),
          ),
      ),
    );
  }
  // Placeholder function to confirm order
  void _confirmOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 80,
          child: Row(
            children: [
              SpinKitCircle(
                color: Theme.of(context).colorScheme.primary,
                size: 50.0,
              ),
              SizedBox(width: 20),
              Text("Processing..."),
            ],
          ),
        ),
      ),
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Order Confirmed'),
          content: Text('Your order has been successfully placed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.main,
                    (Route<dynamic> route) => false);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }
}
