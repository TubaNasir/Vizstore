import 'package:flutterdemo/controllers/bottom_nav_bar_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home/home.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset('assets/animations/order_success.json', repeat: false),
              Text('Thank you for placing \nyour order!\nWe will let you know once your \norder has been confirmed.',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,),
              SizedBox(height: 5),
              CustomButton(text: 'Go to homepage', pressed: () {
                context.read<NavBar>().setPage(navBarPages[0]);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home()),
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
