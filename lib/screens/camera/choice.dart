import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/camera/storage_services.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_button.dart';

class ChoiceScreen extends StatefulWidget {
  ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  Storage storage = Storage();

  File? _selectedImage;

  Future<List<dynamic>> getSimilarImages(File file, String link) async {
    ///MultiPart request
    String filename = file.path.split('/').last;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(link),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    http.StreamedResponse response = await request.send();
    //var responseBytes = await response.stream.toBytes();
    //var responseString = utf8.decode(responseBytes);
    var test1 = await http.Response.fromStream(response);
  final result = jsonDecode(test1.body) as Map<String, dynamic>;
  print(result);
  print(result['SimilarImages']);

    print('\n\n');
    print('RESPONSE WITH HTTP');
    print(response.toString());
    print('\n\n');
    return result['SimilarImages'];
  }

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
                final image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                    
                    if (image != null) {
                      _selectedImage = File(image.path);
                    }
                    setState(() {});
                  //await storage.uploadFile(image.filename,image.path).then((value) => print("done"));
                  List s = await getSimilarImages(
                    File(_selectedImage!.path), "https://5265-111-88-32-81.ngrok.io/similar_image_search");
                    print(s);
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