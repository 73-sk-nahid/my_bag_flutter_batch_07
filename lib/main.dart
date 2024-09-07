import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // Initial quantities and prices
  int pulloverQuantity = 1;
  int tShirtQuantity = 1;
  int sportDressQuantity = 1;

  final int pulloverPrice = 51;
  final int tShirtPrice = 30;
  final int sportDressPrice = 43;

  // Method to calculate total amount
  int getTotalAmount() {
    return (pulloverQuantity * pulloverPrice) +
        (tShirtQuantity * tShirtPrice) +
        (sportDressQuantity * sportDressPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bag')),
      body: Column(
        children: [
          buildItemRow('Pullover', pulloverQuantity, pulloverPrice, 'assets/img.png', () {
            setState(() {
              if (pulloverQuantity > 1) pulloverQuantity--;
            });
          }, () {
            setState(() {
              pulloverQuantity++;
            });
          }),
          buildItemRow('T-Shirt', tShirtQuantity, tShirtPrice, 'assets/img.png', () {
            setState(() {
              if (tShirtQuantity > 1) tShirtQuantity--;
            });
          }, () {
            setState(() {
              tShirtQuantity++;
            });
          }),
          buildItemRow('Sport Dress', sportDressQuantity, sportDressPrice, 'assets/img.png', () {
            setState(() {
              if (sportDressQuantity > 1) sportDressQuantity--;
            });
          }, () {
            setState(() {
              sportDressQuantity++;
            });
          }),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total amount: ${getTotalAmount()}\$',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Congratulations! Checkout complete.')),
                    );
                  },
                  child: Text('CHECK OUT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build item row with increment, decrement, and image
  Widget buildItemRow(String itemName, int quantity, int price, String imagePath,
      VoidCallback onDecrease, VoidCallback onIncrease) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50), // Display item image
      title: Text('$itemName - $price\$'),
      subtitle: Text('Quantity: $quantity'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onDecrease,
          ),
          Text('$quantity'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
