import 'dart:io';
import 'package:av_root_app/src/component/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  File? _image;
  final picker = ImagePicker();
  var imageResponse;
  var er;
  String apiUrl = 'http://192.168.87.42:8080/predict';
  var collection = FirebaseFirestore.instance.collection("data_plants");

  Future getImagegallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('image not selected ');
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('image not selected ');
      }
    });
  }

  Future<void> sendImage(File imageFile, String apiUrl) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Attach the image file to the request
      var image = await http.MultipartFile.fromPath('photo', imageFile.path);
      request.files.add(image);

      // Send the request
      var response = await request.send();

      // Check the response
      if (response.statusCode == 200) {
        // Request was successful
        print('Image sent successfully');
        // Optionally, you can parse and process the response data here
        var responseData = await response.stream.bytesToString();
        print('Response: $responseData["name"]');
        setState(() {
          if (responseData != null) {
            imageResponse = responseData;
          } else {
            print("Erorr respons");
          }
        });
      } else {
        // Request failed
        print('Failed to send image with status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        er = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getImageCamera();
                  },
                  child: _image != null
                      ? Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.file(_image!.absolute),
                        )
                      : DottedBorder(
                          borderType: BorderType.Rect,
                          strokeWidth: 4,
                          dashPattern: [6, 5],
                          radius: Radius.circular(50),
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Iconsax.camera,
                                  size: 70,
                                ),
                                Text(
                                  "Tap to select image",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      getImagegallery();
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                      child: Text(
                        "Uplode image",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          print("Process image ");
          if (_image != null) {
            print("Image => ${_image}");
            await sendImage(_image!, apiUrl);

            if (await imageResponse != null) {
              var data = await collection.where("plant_name",
                  isEqualTo: imageResponse["name"].toString());
              if (imageResponse == data) {
                print("image resposce is equla to thaha dplant data ");
              } else {
                print("image resposce is not  equla to thaha dplant data ");
              }

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${imageResponse}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ));
                },
              );
            } else {
              // print("imageRespons nhi mila \n fir se kar");
              Fluttertoast.showToast(
                  msg: er.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          } else {
            print("image no select");
            Fluttertoast.showToast(
                msg: " image no select \n please select image",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: Container(
          child: Text(
            "Process Image ",
            style: TextStyle(
                color: isDark
                    ? HexColor(RWhiteColor)
                    : HexColor(RMidnightBlueColor),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
