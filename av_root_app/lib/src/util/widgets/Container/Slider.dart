import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../modele/slide.dart';



// Main Widget
class CarouselSliderFromFirestore extends StatefulWidget {
  @override
  _CarouselSliderFromFirestoreState createState() =>
      _CarouselSliderFromFirestoreState();
}

class _CarouselSliderFromFirestoreState
    extends State<CarouselSliderFromFirestore> {
  final FirestoreService _firestoreService = FirestoreService();
  List<ImageModel> _images = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      List<ImageModel> images = await _firestoreService.getImages();
      setState(() {
        _images = images;
        _loading = false;
      });
    } catch (e) {
      print("Error fetching images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)
                  ),
          child: Center(child: CircularProgressIndicator()))
          : CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: _images.map((image) {
                return Builder(
                  builder: (BuildContext context) {

                    return Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(image.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
    );
  }
}
