import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/camera_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/camera/storage_services.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/search/search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';

class ChoiceScreen extends StatefulWidget {
  ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  Storage storage = Storage();

  File? _selectedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      await context.read<CameraProvider>().getProductsList(),
    });
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
                if (!mounted) return;
                  //await storage.uploadFile(image.filename,image.path).then((value) => print("done"));
                  List similarImagesList = await context.read<CameraProvider>().getSimilarImages(
                    File(_selectedImage!.path), "https://5265-111-88-32-81.ngrok.io/similar_image_search");
                    print(similarImagesList);
                List<ProductJson> list = context.read<CameraProvider>().setSimilarProducts(similarImagesList);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      allProducts: list,
                    )));

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