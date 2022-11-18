import 'package:flutter/material.dart';
import '../../order/order_model.dart';
import '../../order/widgets/widgets_order_details/details_card.dart';
import '../../order/widgets/widgets_order_details/products_card.dart';
import '../../order/widgets/widgets_order_details/total_card.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/layout.dart';

class OrderDetailStore extends StatelessWidget {
  const OrderDetailStore({Key? key, required this.ord}) : super(key: key);

  final Order ord;

//   @override
//   State<OrderDetailStore> createState() => _OrderDetailStoreState();
// }
//
// class _OrderDetailStoreState extends State<OrderDetailStore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Details', backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                Text('ORDER ID: ${ord.id}',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                Text('Placed on: 3/9/21',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                DetailsCard(order: ord),
                ProductsCard(order: ord),
                TotalCard(order: ord),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

