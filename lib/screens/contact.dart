import 'package:flutter/material.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: new Text("Contact",style: TextStyle(color: Colors.white),),
      ),
      body:WidgetAnimator(
        Column(
          children: <Widget>[
            SizedBox(height: 40.0,),
            Container(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundColor: primary,
                foregroundColor: primary,
                radius: 40.0,
                backgroundImage: AssetImage('images/Getweys.png'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Getweys Software House',
              style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 20.0),
            ),
            SizedBox(
              height: 15.0,
              width: 200.0,
              child: Divider(
                color: primary,
              ),
            ),
            Text('Software House Working on most advance technologies and developing full stack websites, apps and business solution systems.',
              style: TextStyle(fontSize: 12.0,),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Card(
                elevation: 7,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: primary,
                  ),
                  title: Text('92311 4598019'),
                  onTap: (){
                    _launchPhone();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Card(
                elevation: 7,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: primary,
                  ),
                  title: Text('info@getweys.com'),
                  onTap: (){
                    _launchMail();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _launchPhone() async {
  const url = "tel:92311 4598019";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
void _launchMail() async {
  const url = "mailto:info@getweys.com?subject=Give your subject";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}