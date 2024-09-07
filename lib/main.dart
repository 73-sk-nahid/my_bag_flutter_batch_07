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
      appBar: AppBar(
          title: const Text(
        'My Bag',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      )),
      body: Column(
        children: [
          buildItemRow('Pullover', 'Black', 'L', pulloverQuantity,
              pulloverPrice, 'assets/img.png', () {
            setState(() {
              if (pulloverQuantity > 1) pulloverQuantity--;
            });
          }, () {
            setState(() {
              pulloverQuantity++;
            });
          }),
          buildItemRow('T-Shirt', 'Grey', 'L', tShirtQuantity, tShirtPrice,
              'assets/img.png', () {
            setState(() {
              if (tShirtQuantity > 1) tShirtQuantity--;
            });
          }, () {
            setState(() {
              tShirtQuantity++;
            });
          }),
          buildItemRow('Sport Dress', 'Black', 'M', sportDressQuantity,
              sportDressPrice, 'assets/img.png', () {
            setState(() {
              if (sportDressQuantity > 1) sportDressQuantity--;
            });
          }, () {
            setState(() {
              sportDressQuantity++;
            });
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total amount: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black38, // Color for the label text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${getTotalAmount()}\$', // Assuming getTotalAmount() returns a string
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black, // Color for the total amount text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'Total amount: ',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.normal,
                //           color: Colors.blue, // Color for the label text
                //         ),
                //       ),
                //       TextSpan(
                //         text:
                //             '${getTotalAmount()}\$', // Assuming getTotalAmount() returns a string
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color:
                //               Colors.black, // Color for the total amount text
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Text(
                //   'Total amount: ${getTotalAmount()}\$',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Congratulations! Checkout complete.')),
                    );
                  },
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build item row with increment, decrement, and image
  Widget buildItemRow(
      String itemName,
      String color,
      String size,
      int quantity,
      int price,
      String imagePath,
      VoidCallback onDecrease,
      VoidCallback onIncrease) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0), // Add some padding around the row
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            SizedBox(
              width: 100,
              height: 120, // Set the desired height
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill, // Stretch to fit the box
              ),
            ),
            SizedBox(width: 10), // Add spacing between the image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$itemName',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                            color: Colors.black38,
                          )
                        ],
                      )),
                      // Text(
                      //   '$itemName - $price\$',
                      //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Color: ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                          ),
                        ),
                        TextSpan(
                          text: color,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '    Size: ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                          ),
                        ),
                        TextSpan(
                          text: size,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.black38,
                          onPressed: onDecrease,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.black38,
                          onPressed: onIncrease,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$price\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildItemRow(String itemName, String color, String size, int quantity, int price, String imagePath,
  //     VoidCallback onDecrease, VoidCallback onIncrease) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Spacing around the tile
  //     decoration: BoxDecoration(
  //       color: Colors.white, // Background color
  //       borderRadius: BorderRadius.circular(12.0), // Rounded corners
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3), // Shadow color
  //           spreadRadius: 2, // Spread radius
  //           blurRadius: 5, // Blur radius
  //           offset: Offset(0, 3), // Offset in x and y directions
  //         ),
  //       ],
  //     ),
  //     child: ListTile(
  //       leading: SizedBox(
  //         width: 50, // Set the desired width
  //         height: 250, // Set the desired height
  //         child: Image.asset(
  //           imagePath,
  //           fit: BoxFit.fill, // Adjust how the image fits within the box
  //         ),
  //       ),
  //       //leading: Image.asset(imagePath, width: 50, height: 120),
  //       title: Text('$itemName',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 20,
  //       ),),
  //       subtitle: Text.rich(
  //         TextSpan(
  //           children: [
  //             TextSpan(
  //               text: 'Color: ',
  //               style: TextStyle(fontSize: 15), // Normal text style
  //             ),
  //             TextSpan(
  //               text: color, // Color text with bold font weight
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             TextSpan(
  //               text: '    Size: ', // Spaces added to align with your tab effect
  //               style: TextStyle(fontSize: 15),
  //             ),
  //             TextSpan(
  //               text: size, // Size text with bold font weight
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       trailing: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           IconButton(
  //             icon: Icon(Icons.remove),
  //             onPressed: onDecrease,
  //           ),
  //           Text('$quantity'),
  //           IconButton(
  //             icon: Icon(Icons.add),
  //             onPressed: onIncrease,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
