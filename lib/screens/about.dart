import 'package:flutter/material.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: new Text("About",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: WidgetAnimator(
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundColor: primary,
                    foregroundColor: primary,
                    radius: 100,
                    backgroundImage: Image.asset("images/Getweys.png").image,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("images/github.png")),
                        label: Text('Github'),

                        onPressed:_launchgithub,// html.window.open(Constants.PROFILE_GITHUB,'Hasan Rehman' ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("images/instagram.png")),
                        label: Text('Instagram'),
                        onPressed: _launchinsta,
                      ),FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("images/facebook.png")),
                        label: Text('Facebook'),
                        onPressed:_launchfacebook,
                      ),FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("images/linkedin.png")),
                        label: Text('Linkedin'),
                        onPressed:_launchlinklen,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
_launchgithub() async {
  const url = "https://github.com/getweys";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchlinklen() async {
  const url =  "https://pk.linkedin.com/in/getweys-software-house-3559581b1";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchinsta() async {
  const url = "https://instagram.com/getweys?igshid=1rnzc8ywcone6";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchfacebook() async {
  const url = "https://www.facebook.com/Getweys/";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}