import 'package:flutter/material.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';

class EarnedPoints extends StatefulWidget {
  @override
  _EarnedPointsState createState() => _EarnedPointsState();
}

class _EarnedPointsState extends State<EarnedPoints> {
  List points = [
    {
      'title':'Reward 1',
      'points': '5',
      'subtitle': 'Reward for plant'
    },
    {
      'title':'Reward 1',
      'points': '5',
      'subtitle': 'Reward for plant'
    },
    {
      'title':'Reward 1',
      'points': '5',
      'subtitle': 'Reward for plant'
    },
    {
      'title':'Reward 1',
      'points': '5',
      'subtitle': 'Reward for plant'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => ListView.builder(
            itemCount: points.length,
            itemBuilder: (context,index) => WidgetAnimator(
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primary,
                    child: Icon(Icons.card_giftcard,color: Colors.white,),
                  ),
                  title: Text(points[index]['title'],style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.bold),),
                  subtitle: Row(
                    children: [
                      Text(points[index]['subtitle'],style: TextStyle(color: notifier.darkTheme ? Colors.white :primary),),
                      SizedBox(width: 30,),
                      Text("+ "+points[index]['points'],style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
            )
        ),
      )
    );
  }
}
