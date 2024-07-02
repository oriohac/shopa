import 'package:flutter/material.dart';
import 'package:shopa/model/productsdata.dart';
import 'package:shopa/screens/checkout.dart';
import 'package:shopa/screens/products.dart';

class Screenscon extends StatefulWidget {
  const Screenscon({super.key});

  @override
  State<Screenscon> createState() => _ScreensconState();
}

class _ScreensconState extends State<Screenscon> {
  // Initialize list of cartItems that will be sent and seen in the checkout
  List<Map<String, dynamic>> cartItems = [];
  //function adding products to the cart 
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      cartItems.add(product);
      // feedback or a form of 'toast' to tell us when we added item to the Cart
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${product['productName']} added To Cart'),
        behavior: SnackBarBehavior.floating,
        duration:const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      ));
    });
  }
//initiial screen of the BottomNavigation
  int selectedScreen = 0;
// function to update the screen according to what's selected in the BottomNavigation
  void currentScreen(int state) {
    setState(() {
      selectedScreen = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List out the widgets that will be navigated through
    List<Widget> screens = <Widget>[
      Products(
        productData: productData,
        addToCart: addToCart,
      ),
      Checkout(
        cartItems: cartItems,
      )
    ];
    return Scaffold(
      //the body of the scaffold takes the selected screen
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 18,
          selectedItemColor: Colors.blue,
          currentIndex: selectedScreen,
          onTap: currentScreen,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'Checkout')
          ]),
    );
  }
}
