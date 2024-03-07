//
// import 'dart:html';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
//
// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _controller;
//   final picker = ImagePicker();
//   var imageResponse;
//   var er ;
//   String apiUrl = 'http://192.168.149.42:8080/predict';
//
//
//
//   // Future<void> sendImage(File imageFile, String apiUrl) async {
//   //   try {
//   //     // Create a multipart request
//   //     var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
//   //
//   //     // Attach the image file to the request
//   //     var image = await http.MultipartFile.fromPath('photo', imageFile.path);
//   //     request.files.add(image);
//   //
//   //     // Send the request
//   //     var response = await request.send();
//   //
//   //     // Check the response
//   //     if (response.statusCode == 200) {
//   //       // Request was successful
//   //       print('Image sent successfully');
//   //       // Optionally, you can parse and process the response data here
//   //       var responseData = await response.stream.bytesToString();
//   //       print('Response: $responseData');
//   //       setState(() {
//   //         if (responseData != null) {
//   //           imageResponse = responseData;
//   //         }
//   //         else{
//   //           print("Erorr respons");
//   //         }
//   //
//   //       });
//   //     } else {
//   //       // Request failed
//   //       print('Failed to send image with status code: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     setState(() {
//   //       er = e;
//   //     });
//   //
//   //   }
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     // _controller = CameraController(cameras[0], ResolutionPreset.medium);
//     _controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return Container(
//       );
//     }
//     return Scaffold(
//
//       body: Container(
//         height: 700,
//         child: AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: CameraPreview(_controller),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           try {
//             final image = await _controller.takePicture();
//             setState(() {
//
//
//             });
//             // Do something with the captured image (e.g., save it, display it)
//             print('Image saved to ${image.path}');
//
//           } catch (e) {
//             print(e);
//           }
//         },
//         child: Icon(Icons.camera),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

Future<void> sendSandImage(String imagePath) async {
  // Convert image to bytes
  var bytes = await rootBundle.load(imagePath);
  var buffer = bytes.buffer;
  var imageBytes = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  // Encode the bytes
  var base64Image = base64Encode(imageBytes);

  // Send the API
  var request = http.MultipartRequest('POST', Uri.parse('https://your-api-url.com/upload-image'));
  request.fields['image'] = base64Image;

  // Add the image file
  var file = http.MultipartFile.fromBytes('image_file', imageBytes, filename: 'sand_image.png');
  request.files.add(file);

  // Send the request
  var response = await request.send();

  // Check the response
  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Failed to upload image. Status code: ${response.statusCode}');
  }
}