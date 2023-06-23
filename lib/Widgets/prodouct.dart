import 'package:flutter/material.dart';

class ECommerceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: Padding(
        padding:
            EdgeInsets.all(16.0), // Adjust the value as per your requirements
        child: Column(
          children: [
            // Your e-commerce content goes here
            Text(
              'Welcome to our E-Commerce App!',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Image.asset(
                'assets/icons/jacket.png'), // Add space between widgets vertically
            Image.network('https://example.com/product_image.jpg'),
            SizedBox(height: 16.0),
            Text(
              'Product Description',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: \$99.99',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
