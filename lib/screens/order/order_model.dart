
import '../../models/product_model.dart';

class Order {
  final int id;
  final String name;
  final int contact;
  final String address;
  final String city;
  final String status;
  final DateTime placedOn;
  final int total;
  final List<Product> products;

  Order(
      {required this.id,
        required this.name,
        required this.contact,
        required this.address,
        required this.city,
        required this.status,
        required this.placedOn,
        required this.total,
        required this.products});
}

// Order order = Order(
//   id: 1,
//   name: 'Faakeha Ahmed',
//   contact: 02323223232,
//   address: 'Iba Karachi akjskajd sajdka akjdksd',
//   city: 'Karachi',
//   status: 'Placed',
//   placedOn: DateTime.now(),
//   total: 1000,
//   products: [
//     Product(
//       id: 1,
//       image:
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
//       title: "Wireless Controller for PS4™",
//       price: 1000,
//       quantity: 2,
//       description: "This is a red shirt. Material is agdjd",
//       storeID: 1,
//     ),
//     Product(
//       id: 2,
//       image:
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
//       title: "Wireless Controller for PS4™",
//       price: 1000,
//       quantity: 2,
//       description: "This is a red shirt. Material is agdjd",
//       storeID: 1,
//     ),
//   ],
// );

List<Order> demoOrders = [
  Order(
    id: 1,
    contact: 02323223232,
    name: 'Faakeha Ahmed',
    address: 'Iba Karachi akjskajd sajdka akjdksd',
    city: 'Karachi',
    status: 'Confirmed',
    placedOn: DateTime.now(),
    total: 1000,
    products: [
      Product(
        id: 1,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
      Product(
        id: 2,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
    ],
  ),
  Order(
    id: 2,
    contact: 02323223232,
    name: 'Faakeha Ahmed',
    address: 'Iba Karachi akjskajd sajdka akjdksd',
    city: 'Karachi',
    status: 'Cancelled',
    placedOn: DateTime.now(),
    total: 1000,
    products: [
      Product(
        id: 1,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
      Product(
        id: 2,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
    ],
  ),
  Order(
    id: 3,
    contact: 02323223232,
    name: 'Faakeha Ahmed',
    address: 'Iba Karachi akjskajd sajdka akjdksd',
    city: 'Karachi',
    status: 'Placed',
    placedOn: DateTime.now(),
    total: 1000,
    products: [
      Product(
        id: 1,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
      Product(
        id: 2,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
    ],
  ),
  Order(
    id: 4,
    contact: 02323223232,
    name: 'Faakeha Ahmed',
    address: 'Iba Karachi akjskajd sajdka akjdksd',
    city: 'Karachi',
    status: 'Placed',
    placedOn: DateTime.now(),
    total: 1000,
    products: [
      Product(
        id: 1,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
      Product(
        id: 2,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
    ],
  ),
  Order(
    id: 5,
    contact: 02323223232,
    name: 'Faakeha Ahmed',
    address: 'Iba Karachi akjskajd sajdka akjdksd',
    city: 'Karachi',
    status: 'Placed',
    placedOn: DateTime.now(),
    total: 1000,
    products: [
      Product(
        id: 1,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
      Product(
        id: 2,
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
        title: "Wireless Controller for PS4™",
        price: 1000,
        quantity: 2,
        description: "This is a red shirt. Material is agdjd",
        storeID: 1,
      ),
    ],
  )
];
