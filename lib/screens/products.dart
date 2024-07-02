import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopa/model/productsdata.dart';

class Products extends StatefulWidget {
  //get List of product data
  final List<Map<String, dynamic>> productData;
  final Function(Map<String, dynamic>) addToCart;
  const Products({super.key, required this.productData, required this.addToCart});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //remove the Flutter auto-generated back button
        automaticallyImplyLeading: false,
          titleSpacing: 30,
          title: const Text(
            'Watch World',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(26, 56, 54, 54),
            ),
            child: Column(
              children: [
                // display list of the productData ranging from the first to the last
                for (int i = 0; i < productData.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                productData[i]['productImage'],
                              ),
                            ),
                            Text(
                              productData[i]['productName'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              productData[i]['description'],
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₦${productData[i]['price']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                ElevatedButton(
                                    onPressed: () {
                                      widget.addToCart(productData[i]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                    child: const Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
