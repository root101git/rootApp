// Define a model class for your Firestore documents
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  factory ImageModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    if (data == null || data['image'] == null) {

      throw Exception("Invalid document format or imageUrl is null");
    }
    return ImageModel(
      imageUrl: data['image'],
    );
  }
}

// Service class to interact with Firestore
class FirestoreService {
  final CollectionReference imagesCollection =
  FirebaseFirestore.instance.collection('slider_image');

  Future<List<ImageModel>> getImages() async {
    QuerySnapshot querySnapshot = await imagesCollection.get();
    return querySnapshot.docs
        .map((doc) => ImageModel.fromFirestore(doc))
        .toList();
  }
}