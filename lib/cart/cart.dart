import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutterdemo/checkout/checkout.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutterdemo/widgets/button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../success/success.dart';
import '../widgets/customAppBar.dart';
import '../widgets/layout.dart';
import 'product_model.dart';

class Cart extends StatefulWidget {
  final CameraDescription camera;
  const Cart({required this.camera,super.key});

  @override
  State<Cart> createState() => _CartState(camera);
}

class _CartState extends State<Cart> {
  late List<Product1> cartList;
  final CameraDescription camera;

  _CartState(this.camera);

  @override
  void initState() {
    cartList = [
      Product1(
          id: 1,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
          price: 1000,
          description:
              "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
          storeID: 1,
          qty: 1),
      Product1(
          id: 2,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          qty: 1),
      Product1(
          id: 3,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          qty: 1),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: "Cart",
            backButton: false,
          ),
          //backgroundColor: Colors.grey.shade200,
          body: Stack(children: [
            Layout(
                widget: SingleChildScrollView(
              child: Column(children: [
                Column(
                  children: cartList
                      .map((e) => CartCard(
                          product: e,
                          cartList: cartList,
                          onCartChanged: () {
                            setState(() {});
                          }))
                      .toList(),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: cartList.length,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       //CartCards(productImage: cartList[index].image, cardTitle: cartList[index].title, cardSubtitle: cartList[index].price.toString(), press: (){}),
                //       child: CartCard(
                //         product: cartList[index],
                //         cartList: cartList,
                //         onCartChanged: () {
                //           setState(() {});
                //         },
                //       ),
                //     );
                //   },
                // ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SecondaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total: ',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'Rs 2700',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Checkout',
                  pressed: () {
                    Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Checkout(camera: camera,))
                            );
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => const Checkout())
                //     );
                //   },
                //   child: const Text("Continue")
                // ),
                SizedBox(height: 100),
              ]),
            )),
            BottomNavBar(camera: camera,)
          ])),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard(
      {Key? key,
      required this.product,
      required this.cartList,
      required this.onCartChanged})
      : super(key: key); //required this.actualProduct}) : super(key: key);

  final List<Product1> cartList;
  final Product1 product;
  final VoidCallback onCartChanged;

  //final Product actualProduct;
  @override
  // ignore: no_logic_in_create_state
  State<CartCard> createState() => _CartCardState(cartList, onCartChanged);
}

class _CartCardState extends State<CartCard> {
  final List<Product1> cartList;
  final VoidCallback onCartChanged;

  _CartCardState(this.cartList, this.onCartChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 1.11,
                child: Container(
                    //width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: SecondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Image.network(widget.product.image)),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(
                                      widget.product.title,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    setState(() {
                                      cartList.remove(widget.product);
                                    });
                                    onCartChanged();
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red.shade900,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Text("Store name",
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Rs. ${widget.product.price}",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          setState(() {
                                            widget.product.qty--;
                                            //widget.actualProduct.qty--;
                                            if (widget.product.qty < 1) {
                                              cartList.remove(widget.product);
                                            }
                                          });
                                          onCartChanged();
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "${widget.product.qty}",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: () {
                                            setState(() {
                                              widget.product.qty++;
                                            });
                                            onCartChanged();
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.black,
                                            size: 20,),
                                        ),
                                    ]),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Card(
    //   elevation: 3,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //   child:  ListTile(
    //     leading: Container(
    //         height: MediaQuery.of(context).size.height,
    //         decoration: BoxDecoration(
    //           color: Colors.red,
    //           borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(10.0),
    //               topRight: Radius.circular(10.0)),
    //         ),
    //         child: Image.network(widget.product.image)
    //     ),
    //     title: Text(widget.product.title, maxLines: 2, overflow: TextOverflow.ellipsis,),
    //     subtitle: Text("Rs. ${widget.product.price}"),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         IconButton(
    //         onPressed: () {
    //           setState(() {
    //             widget.product.qty--;
    //             //widget.actualProduct.qty--;
    //             if (widget.product.qty < 1) {
    //               cartList.remove(widget.product);
    //             }
    //           });
    //           onCartChanged();
    //         },
    //         icon: const Icon(Icons.remove),
    //         ),
    //         Text("${widget.product.qty}"),
    //         IconButton(
    //         onPressed: () {
    //           setState(() {
    //             widget.product.qty++;
    //           });
    //           onCartChanged();
    //         },
    //         icon: const Icon(Icons.add),),
    //       ])
    //     )
    //   );
  }
}

class CartCards extends StatefulWidget {
  const CartCards(
      {Key? key,
      required this.productImage,
      required this.cardTitle,
      required this.cardSubtitle,
      //required this.icon,
      required this.press})
      : super(key: key);

  final String productImage;
  final String cardTitle, cardSubtitle;

  //final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 1.11,
              child: Container(
                  //width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: SecondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Image.network(productImage)),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      cardTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    cardSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
