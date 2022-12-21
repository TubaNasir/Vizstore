import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/home/home.dart';

class CustomAppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarSearch({Key? key, required this.title, required this.backButton})
      : super(key: key);

  final String title;
  final bool backButton;


  @override
  State<CustomAppBarSearch> createState() => _CustomAppBarSearchState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarSearchState extends State<CustomAppBarSearch> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 70.0,
                    color: Color(0xFDFDFDFF),
                  ),
                  Container(
                      height: 70.0,
                      //color: Color(0xFDFDFDFF),
                      decoration: BoxDecoration(
                        //color: Color(0xFDFDFDFF),
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0)),
                        gradient: PrimaryGradientColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.backButton
                                ? InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            )
                                : SizedBox(width: 30),
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: PrimaryGradientColor,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFDFDFDFF),
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(30.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
