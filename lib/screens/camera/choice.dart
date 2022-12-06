import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/camera/storage_services.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_button.dart';

class ChoiceScreen extends StatelessWidget {
  ChoiceScreen({super.key});
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black,),
        title: const Text(
          'Image Search',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.upload_file_rounded,size: 60,color: PrimaryColor,),
              SizedBox(height: 30,),
              CustomButton(
                text: 'Upload Image',
                pressed: () async{
                  // final image = ImagePicker().pickImage(
                  //     source: ImageSource.gallery,
                  //     maxWidth: 1800,
                  //     maxHeight: 1800,
                  // );
                  // await storage.uploadFile(image.filename,image.path).then((value) => print("done"));
                },
              ),
              const Text("or"),
              CustomButton(
                text: 'Take Photo',
                pressed: () async{
                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();
                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras[0];
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CameraScreen(camera: firstCamera)));
                },
              ),
            ],
          ),
        ),
    );
  }
}