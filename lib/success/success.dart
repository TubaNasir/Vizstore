import 'package:camera/camera.dart';
import 'package:flutterdemo/home/home.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:flutterdemo/widgets/button.dart';
import 'package:flutterdemo/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


class Success extends StatefulWidget {
  final CameraDescription camera;
  const Success({required this.camera,super.key});

  @override
  State<Success> createState() => _SuccessState(camera);
}

class _SuccessState extends State<Success> {

  final int _orderId = 13423;
  final CameraDescription camera;
  
  _SuccessState(this.camera);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset('assets/animations/order_success.json', repeat: false),
              Text('Thank you for placing \nyour order!\nYour order ID is ${_orderId}.\nWe will let you know once your \norder has been confirmed.',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,),
              SizedBox(height: 5),
              CustomButton(text: 'Go to homepage', pressed: () {
                context.read<NavBar>().setPage('home');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home(camera: camera,)),
                );
              },
              ),
            ],
          )
        ),
      ),
    );
  }
}
