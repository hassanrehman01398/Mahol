import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahool/screens/home.dart';
import 'package:mahool/utils/picker_widgets.dart';
import 'package:mahool/utils/theme.dart';
import 'package:mahool/utils/widgets.dart';
import 'package:provider/provider.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  File _image;
  // final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: Text("Profile",style: TextStyle(color:notifier.darkTheme ? Colors.white :primary,fontSize: 20,fontWeight: FontWeight.w700),)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75,right: 75,top: 10,bottom: 10),
              child: TextField(
                cursorColor: primary,
                decoration:InputDecoration(
                    hintStyle: TextStyle(color: notifier.darkTheme ? Colors.white :primary),
                    hintText: "Your Username"
                ),
              ),
            ),
            SizedBox(height: 10,),
            _image == null ? Text("Upload your profile picture",style: TextStyle(color:notifier.darkTheme ? Colors.white :primary),textAlign: TextAlign.center,) : Image.file(_image,height: 350,),
          ],
        ),
      ),
      floatingActionButton: _image == null ? FloatingActionButton(
          child: Icon(Icons.camera_alt,color: Colors.white,),
          backgroundColor: primary,
          // Provide an onPressed callback.
          onPressed:uploadImage
      ):FloatingActionButton(
          child: Icon(Icons.check,color: Colors.white,),
          backgroundColor: primary,
          // Provide an onPressed callback.
           onPressed: (){
            Navigator.pop(context);
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
           }
      ),
    );
  }
  void uploadImage() {
    openImagePicker(context, (file) {
      setState(() {
        _image = file;
      });
    });
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Display the Picture')
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.file(File(imagePath)),
      ),
    );
  }
}