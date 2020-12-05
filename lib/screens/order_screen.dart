import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List orders = [
    {
      'date':DateTime.now(),
    },
    {
      'date':DateTime.now(),
    },
    {
      'date':DateTime.now(),
    },
    {
      'date':DateTime.now(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context,index) => WidgetAnimator(
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primary,
                      child: Icon(Icons.payment),
                    ),
                    title: Text("Order",style: TextStyle(color: notifier.darkTheme ? Colors.white :primary),),
                    subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(orders[index]["date"])),
                  ),
                ),
              ),
            )
        ),
      )
    );
  }
}
