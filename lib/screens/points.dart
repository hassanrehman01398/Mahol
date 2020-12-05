import 'package:flutter/material.dart';
import 'package:mahool/screens/all_points.dart';
import 'package:mahool/screens/earned_points.dart';
import 'package:mahool/screens/used_points.dart';

class Point extends StatefulWidget {
  @override
  _PointState createState() => _PointState();
}

class _PointState extends State<Point> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('0 Points'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.card_giftcard),
                text: 'All',
              ),
              Tab(
                icon: Icon(Icons.whatshot),
                text: 'Earned',
              ),
              Tab(
                icon: Icon(Icons.payment),
                text: 'Used',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllPoints(),
            EarnedPoints(),
            UsedPoints()
          ],
        ),
      ),
    );
  }
}