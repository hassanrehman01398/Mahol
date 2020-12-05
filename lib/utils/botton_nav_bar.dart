library bottom_navy_bar;

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color backgroundColor;
  final List<BottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final Function ontap;

  BottomNavBar(
      {Key key,
        this.currentIndex = 0,
        this.iconSize = 24,
        this.backgroundColor,
        @required this.items,
        @required this.onItemSelected, this.ontap}) {
    assert(items != null);
    assert(items.length >= 2 || items.length >= 5);
    assert(onItemSelected != null);
  }

  @override
  _BottomNavBarState createState() {
    return _BottomNavBarState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        onItemSelected: onItemSelected);
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  final int currentIndex;
  final double iconSize;
  Color backgroundColor;
  List<BottomNavBarItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _BottomNavBarState(
      {@required this.items,
        this.currentIndex,
        this.backgroundColor,
        this.iconSize,
        @required this.onItemSelected});

  Widget _buildItem(BottomNavBarItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 125 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 270),
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: BoxDecoration(
        color: isSelected ? item.activeColor.withOpacity(0.3) : backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : item.inactiveColor == null
                          ? item.activeColor
                          : item.inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                style: TextStyle(
                    color: item.activeColor, fontWeight: FontWeight.bold),
                child: item.title,
              )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              widget.ontap(index);
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavBarItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavBarItem(
      {@required this.icon,
        @required this.title,
        this.activeColor = Colors.blue,
        this.inactiveColor}) {
    assert(icon != null);
    assert(title != null);
  }
}