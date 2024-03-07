import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Text/text_wedgets.dart';

class FeedbackPage extends StatefulWidget {


  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(child: NameTextWidgets(textName: "Feedback")),


      ],
        ),

      ),
    );
  }
}
