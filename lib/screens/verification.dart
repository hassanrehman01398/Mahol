import 'package:camera/new/src/support_android/camera.dart';
import 'package:flutter/material.dart';
import 'package:mahool/screens/other_details.dart';
import 'package:mahool/utils/theme.dart';
import 'package:mahool/utils/widgets.dart';
import 'package:provider/provider.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();

  FocusNode focusNode7 = FocusNode();
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => Container(
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
              Center(
                child: Text(
                  "Verification",
                  style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.w700,fontSize: 30),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 1,left: 60,right: 17),
                child: Text(
                  "Please enter the 6 digit code",
                  style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8,left: 12,right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getPinField(key: "1", focusNode: focusNode1, notifier: notifier),
                    SizedBox(width: 5.0),
                    getPinField(key: "2", focusNode: focusNode2, notifier: notifier),
                    SizedBox(width: 5.0),
                    getPinField(key: "3", focusNode: focusNode3, notifier: notifier),
                    SizedBox(width: 5.0),
                    getPinField(key: "4", focusNode: focusNode4, notifier: notifier),
                    SizedBox(width: 5.0),
                    getPinField(key: "5", focusNode: focusNode5, notifier: notifier),
                    SizedBox(width: 5.0),
                    getPinField(key: "6", focusNode: focusNode6, notifier: notifier),
                    SizedBox(width: 5.0),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(top:30.0,left: 70,right: 60),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: primary)
                    ),
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Resend",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                    color: primary,
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TakePictureScreen()));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getPinField({String key, FocusNode focusNode,ThemeNotifier notifier}) => SizedBox(
    height: 50.0,
    width: 45.0,
    child: TextField(
      key: Key(key),
      expands: false,
//          autofocus: key.contains("1") ? true : false,
      autofocus: false,
      focusNode: focusNode,
      onChanged: (String value) async {
        if (value.length == 1) {
          code += value;
          switch (code.length) {
            case 1:
              FocusScope.of(context).requestFocus(focusNode2);
              break;
            case 2:
              FocusScope.of(context).requestFocus(focusNode3);
              break;
            case 3:
              FocusScope.of(context).requestFocus(focusNode4);
              break;
            case 4:
              FocusScope.of(context).requestFocus(focusNode5);
              break;
            case 5:
              FocusScope.of(context).requestFocus(focusNode6);
              break;
            case 6:
              FocusScope.of(context).requestFocus(focusNode7);
              break;
            default:
              FocusScope.of(context).requestFocus(FocusNode());
              break;
          }
        }
      },
      maxLengthEnforced: false,
      textAlign: TextAlign.center,
      cursorColor: notifier.darkTheme ? Colors.white :primary,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: notifier.darkTheme ? Colors.white :primary),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primary),
          ),
          hoverColor: primary,
          fillColor: primary,
          focusColor: primary
      ),
    ),
  );
}
