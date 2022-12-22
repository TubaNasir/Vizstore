import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/camera_provider.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/camera/storage_services.dart';
import 'package:flutterdemo/screens/search/search.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {

  ChoiceScreen({super.key});

  Storage storage = Storage();

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
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
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'AI Visual Search',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                child: Image.asset(
                  "assets/images/image_scan.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Upload or click an image to find similar products in our app using AI.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Upload Image',
              pressed: () async {
                final image = await ImagePicker.platform
                    .pickImage(source: ImageSource.gallery);

                if (image != null) {
                  _selectedImage = File(image.path);
                }

                List similarImagesList = await context
                    .read<CameraProvider>()
                    .getSimilarImages(File(_selectedImage!.path),
                        "https://195a-111-88-41-214.ngrok.io/similar_image_search");

                List<ProductJson> list = context
                    .read<CameraProvider>()
                    .setSimilarProducts(similarImagesList);

                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                          allProducts: list,
                          imagePath: _selectedImage!.path,
                        )));
              },
            ),
            const Text("or"),
            CustomButton(
              text: 'Take Photo',
              pressed: () async {
                final cameras = await availableCameras();
                final firstCamera = cameras[0];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraScreen(camera: firstCamera)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
