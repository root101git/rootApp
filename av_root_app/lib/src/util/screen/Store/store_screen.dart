import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,

        title:  Text(
          "Store",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900),
        ),

      ),
      body: Center(
        child: Text("Coming Soon...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
      ),
    );
  }
}
