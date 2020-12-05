import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final String type;

  const ProfilePage({Key key, this.type}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final phoneController = TextEditingController();
  final classController = TextEditingController();
  final sectionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var email,url1,name,studentId,phone,studentClass,section;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.type == "abc"? AppBar(
          title: Text("Profile"),
        ):null,
        body: Consumer<ThemeNotifier>(
          builder: (context,notifier,child) => Container(
            child: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    WidgetAnimator(
                      GestureDetector(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: primary,
                            child: CircleAvatar(
                                backgroundColor: primary,
                                radius: 100,
                                backgroundImage: NetworkImage(url1 == null?'https://www.w3schools.com/howto/img_avatar.png':url1)
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 25.0,
                        ),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            WidgetAnimator(
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 0.0),
                                  child: Container(
                                    child: new Text(
                                      'Personal Information',
                                      style: TextStyle(
                                        color: notifier.darkTheme ? Colors.white :primary,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            WidgetAnimator(
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Consumer<ThemeNotifier>(
                                  builder: (context,notifier,child) => SwitchListTile(
                                    activeColor: primary,
                                    title: Text("Dark Mode",style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.bold),),
                                    onChanged: (val){
                                      notifier.toggleTheme();
                                      print(notifier.darkTheme);
                                    },
                                    value: notifier.darkTheme,
                                  ),
                                ),
                              ),
                            ),
                            WidgetAnimator(
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 35.0,
                                  ),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Username',
                                            style: TextStyle(
                                                color: notifier.darkTheme ? Colors.white :primary,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            WidgetAnimator(
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          enabled: false,
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            WidgetAnimator(
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Phone Number',
                                            style: TextStyle(
                                                color: notifier.darkTheme ? Colors.white :primary,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            WidgetAnimator(
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          enabled: false,
                                          controller: phoneController,
                                          decoration: const InputDecoration(
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            WidgetAnimator(_getActionButtons())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
       ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Delete"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}