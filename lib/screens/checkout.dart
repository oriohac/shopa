import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  //get the cartitems
  final List<Map<String, dynamic>> cartItems;
  //and pass it as a parameter in Checkout
  const Checkout({super.key, required this.cartItems});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late List<Map<String, dynamic>> cartItems;
  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

//function to calculate total price during checkout
  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item['price']);
  }

//function to complete order and clear the cart
  void completeOrder() {
    setState(() {
      cartItems.clear();
    });
//Success message after completing order
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Success'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    ));
    Navigator.pushNamed(context, "/ordersuccess");
  }

// Remove a single item function in the checkout page,
//wich is passed to the icon button
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30,
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          children: [
            Expanded(
              // if cart is Empty
              child: widget.cartItems.isEmpty
                  //display text below
                  ? const Text(
                      "No Items in cart",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  // then if there are cartItems available display them on a card
                  : ListView.builder(
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                  widget.cartItems[index]['productImage']),
                            ),
                            title: Text(
                              widget.cartItems[index]['productName'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle:
                                Text('₦${widget.cartItems[index]['price']}'),
                            //Icon button to delete single Cart Item
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                removeItem(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            //display the total amount and convert it to String
            Text(
                "Total Order Amount: \₦${calculateTotalPrice().toStringAsFixed(2)}"),
                //Button to complete order
            SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    completeOrder();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  child: const Text(
                    'Complete Order',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
