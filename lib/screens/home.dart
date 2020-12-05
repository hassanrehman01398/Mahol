import 'package:circular_menu/circular_menu.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mahool/screens/about.dart';
import 'package:mahool/screens/cart_screen.dart';
import 'package:mahool/screens/chat.dart';
import 'package:mahool/screens/contact.dart';
import 'package:mahool/screens/ecommerce.dart';
import 'package:mahool/screens/favorities.dart';
import 'package:mahool/screens/group_chat.dart';
import 'package:mahool/screens/maps.dart';
import 'package:mahool/screens/profile.dart';
import 'package:mahool/utils/botton_nav_bar.dart';
import 'package:mahool/utils/drawer.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _colorName = 'No';
  Color _color = Colors.black;
  List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  PageController pageController;
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    _pages = [
      {'title': 'Home'},
      {'title': 'Map'},
      {'title': 'Favorites'},
      {'title': 'Cart'},
      {'title': 'Profile'}
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Consumer<ThemeNotifier>(
          builder: (context,notifier,child) => MyDrawer(type: notifier.darkTheme),
      ),
      body: PageView(
        children: <Widget>[
          Ecommerce(),
          MapsScreen(),
          Favourites(),
          CartScreen(),
          ProfilePage(),
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavBar(
        backgroundColor: primary,
        ontap: _selectPage,
        onItemSelected: onItemSelected,
        items: [
          BottomNavBarItem(
            icon: Icon(Icons.home),
            title: Text('Home',style: TextStyle(color: ascent),),
            activeColor: ascent,
          ),
          BottomNavBarItem(
              icon: Icon(Icons.map),
              title: Text('Maps',style: TextStyle(color: ascent),),
              activeColor: ascent
          ),
          BottomNavBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites',style: TextStyle(color: ascent),),
              activeColor: ascent
          ),
          BottomNavBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart',style: TextStyle(color: ascent),),
              activeColor: ascent
          ),
          BottomNavBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Profile',style: TextStyle(color: ascent),),
              activeColor: ascent
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be `Alignment.center`
          alignment: Alignment.bottomRight,
          ringColor: Colors.green.withAlpha(200),
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 54.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(
          ),
          fabColor: primary,
          fabOpenIcon: Icon(Icons.chat, color: Colors.white),
          fabCloseIcon: Icon(Icons.close, color: Colors.white),
          //fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Chats()));
              },
              shape: CircleBorder(),
              child: Icon(Icons.chat, color: Colors.white,size: 40,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GroupChat()));
              },
              shape: CircleBorder(),
              child: Icon(Icons.group, color: Colors.white,size: 40,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              },
              shape: CircleBorder(),
              child: Icon(Icons.info, color: Colors.white,size: 40,),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
              },
              shape: CircleBorder(),
              child: Icon(Icons.phone, color: Colors.white,size: 40,),
            ),
            RawMaterialButton(
              onPressed: null,
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
      // floatingActionButton: CircularMenu(
      //   alignment: Alignment.bottomRight,
      //   toggleButtonColor: primary,
      //   items: [
      //     CircularMenuItem(
      //         icon: Icons.home,
      //         color: primary,
      //         onTap: () {
      //           setState(() {
      //             _color = Colors.green;
      //             _colorName = 'Green';
      //           });
      //         }),
      //     CircularMenuItem(
      //         icon: Icons.search,
      //         color: primary,
      //         onTap: () {
      //           setState(() {
      //             _color = Colors.blue;
      //             _colorName = 'Blue';
      //           });
      //         }),
      //     CircularMenuItem(
      //         icon: Icons.settings,
      //         color: primary,
      //         onTap: () {
      //           setState(() {
      //             _color = Colors.orange;
      //             _colorName = 'Orange';
      //           });
      //         }),
      //     CircularMenuItem(
      //         icon: Icons.chat,
      //         color: primary,
      //         onTap: () {
      //           setState(() {
      //             _color = Colors.purple;
      //             _colorName = 'Purple';
      //           });
      //         }),
      //   ],
      // ),
    );
  }
}

