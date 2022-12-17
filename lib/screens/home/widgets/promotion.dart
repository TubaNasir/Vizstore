import 'package:flutter/material.dart';

class Promotion extends StatelessWidget {
  const Promotion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child:
                Image.asset("assets/images/banner2.jpg", fit: BoxFit.fill)),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF343434).withOpacity(0.4),
                      const Color(0xFF343434).withOpacity(0.15),
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text.rich(
                TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                    text: "10% Off\n",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Offer valid till Friday!'),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}