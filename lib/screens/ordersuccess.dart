import 'package:flutter/material.dart';
import 'package:shopa/screens/screenscon.dart';

class Ordersuccess extends StatelessWidget {
  const Ordersuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Order Success', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_sharp,
                size: 150,
                color: Colors.green,
              ),
              SizedBox(height: 8,),
              const Text(
                'Your Order Was Successful!',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(height: 8,),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screenscon()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                    child: const Text('Return Home',style: TextStyle(color: Colors.white, fontSize: 18),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
