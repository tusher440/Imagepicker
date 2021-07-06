import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_image/firebase_image.dart';

class sendimage extends StatefulWidget {
  const sendimage({Key? key}) : super(key: key);

  @override
  _sendimageState createState() => _sendimageState();
}

class _sendimageState extends State<sendimage> {

  var image;
  final picker = ImagePicker();

  get pickedfile => pickedfile;
  // get value => value;

  Future getImagefromcamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = image;
      // if(pickedImage != null){
      //   _image = (pickedImage.path);
      // }else{
      //   print("no image selected");
      // }
    });
  }


  Future getImagefromGallery() async {
    var _image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = _image;

      // if(pickedImage != null){
      //   _image = (pickedImage.path);
      // }else{
      //   print("no image selected");
      // }
    });

    // Future uploadImageToFirebase(BuildContext context) async {
    //   String? fileName = basename(_image.path);
    //   StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('upload/$fileName') as StorageReference;
    //   // ignore: non_constant_identifier_names
    //   StorageUploadTask UploadTask = firebaseStorageRef.putFile(_image);
    //   StorageTaskSnapshot taskSnapshot = await UploadTask.onComplete;
    //   taskSnapshot.ref.getDownLoadURL().then(
    //       (value) => print("Done:$value")
    //   );
    // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Flutter image"),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Image picker",
                style: TextStyle(fontSize: 20,),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: image == null ? Text("No image show"): Image.file(image),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: getImagefromcamera,
                  tooltip: "pickedImage",
                  child: Icon(Icons.add_a_photo),
                ),

                FloatingActionButton(
                  onPressed: getImagefromGallery,
                  tooltip: "pickedImage",
                  child: Icon(Icons.camera_alt),
                ),
                //SizedBox(height: 20,),
                // Expanded(
                //   child: Stack(
                //      children: [
                //        Container(
                //          height: double.infinity,
                //          margin: const EdgeInsets.only(
                //            left: 30.0, top: 10.0, right: 20.0,),
                //          child: ClipRRect(
                //            borderRadius: BorderRadius.circular(30.0),
                //            child: image != null ? Image.file(image):
                //            FlatButton(
                //                onPressed: () {
                //
                //                },
                //                child: Icon(
                //                  Icons.add_a_photo,
                //                  size: 20,
                //                ),
                //            ),
                //          ),
                //        ),
                //        Container(
                //          child: Stack(
                //            children: [
                //              Container(
                //
                //              )
                //            ],
                //          ),
                //        )
                //      ],
                //   ),
                // )
              ],
            )
          ],
        ),

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  //String ?basename(path) {}

}

// class StorageUploadTask {
//   get onComplete => onComplete;
// }
//
// class StorageTaskSnapshot {
//   get ref => ref;
// }
//
// class StorageReference {
//   putFile(image) {}
// }


