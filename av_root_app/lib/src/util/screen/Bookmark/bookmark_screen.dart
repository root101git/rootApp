import 'package:av_root_app/src/util/widgets/ListViewBilderW.dart';
import 'package:flutter/material.dart';


class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title:  Text(
          "BookMark",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900),
        ),

      ),
      body: Container(
              child: ListViewBilderW(),
      ),
    );
  }
}
