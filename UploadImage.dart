import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.yellow,
      title: 'Firebase Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Upload(),
    );
  }

  //const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
   var image;

   final picker = ImagePicker();

   Future pickImage() async {
     final pickedFile = await picker.getImage(source: ImageSource.gallery);
     setState(() {
       image = File(pickedFile!.path);
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              gradient: LinearGradient(
                colors: [Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
              ),
            ),
      Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Upload Image To Firebase Storage",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      // ignore: unnecessary_null_comparison
                      child: image != null ? Image.file(image):
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {

                        },
                        child: Icon(
                          Icons.add_a_photo,
                          size: 40,
                        ),

                      ),
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      ),

      Container(
        child: Stack(
          children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text("upload image",
                style: TextStyle(fontSize: 20),
                ),
                ),
          ],
        ),
      ),
      ],
     ),
    );
  }
}
