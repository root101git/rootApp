import 'package:av_root_app/src/component/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

class SearchBoxWidgets extends StatefulWidget {
  const SearchBoxWidgets({super.key});

  @override
  State<SearchBoxWidgets> createState() => _SearchBoxWidgetsState();
}

class _SearchBoxWidgetsState extends State<SearchBoxWidgets> {
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: '  Ex. tulsi',
        hintStyle: TextStyle(),
        labelText: " Search ",
        labelStyle: TextStyle(
          fontSize: 20,
          color: HexColor(RGaryColor)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          gapPadding: 4,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Icon(
              Iconsax.search_status,
              color: HexColor(RGreenColor),
              size: 35,
            ),
            onPressed: () {
              print(_searchController);
            },
          ),
        ),
      ),
      style: TextStyle(),
    );
  }
}
