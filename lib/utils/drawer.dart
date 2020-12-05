import 'package:flutter/material.dart';
import 'package:mahool/screens/cart_screen.dart';
import 'package:mahool/screens/order_screen.dart';
import 'package:mahool/screens/points.dart';
import 'package:mahool/screens/profile.dart';
import 'package:mahool/screens/setting.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';
class MyDrawer extends StatefulWidget {
  final bool type;
  const MyDrawer({
    Key key, this.type,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            'Username',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                color: ascent,
                fontSize: 15.0),
          ),
          accountEmail: Text(
            'Email',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
                color: ascent,
                fontSize: 13.0),
          ),
          currentAccountPicture: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(type:"abc")));
            },
            child: CircleAvatar(
              radius: 150,
              backgroundColor: primary,
              child: CircleAvatar(
                  backgroundColor: primary,
                  radius: 150,
                  backgroundImage: NetworkImage('https://www.w3schools.com/howto/img_avatar.png')
              ),
            ),
          ),
        ),

        ListTile(
          onTap: (){
            Navigator.pop(context);
          },
          title: Text(
            'Home',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
                color: widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700),
          ),
          leading: Icon(
            Icons.home,
            size: 25,
            color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
          ),
        ),

        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Point()));
          },
          title: Text(
            'Points',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
                color: widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700),
          ),
          leading: Icon(
            Icons.monetization_on,
            size: 25,
            color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Order()));
          },
          title: Text(
            'Orders',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
                color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700),
          ),
          leading: Icon(
            Icons.payment,
            size: 25,
            color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
          ),
          onLongPress: () {},
        ),
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(type:"abc")));
          },
          title: Text(
            'Cart',
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
                color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700),
          ),
          leading: Icon(
            Icons.shopping_cart,
            size: 25,
            color:  widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
          ),
        ),

        ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  color: widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700),
            ),
            leading: Icon(
              Icons.exit_to_app,
              size: 25,
              color: widget.type ? Theme.of(context).accentColor :Theme.of(context).primaryColor,
            ),
            onTap: () {
              Navigator.of(context).pop();
            }),
      ]),
    );
  }
}