import 'package:flutter/material.dart';
import 'package:mahool/phoneField/intl_phone_field.dart';
import 'package:mahool/screens/verification.dart';
import 'package:mahool/utils/theme.dart';
import 'package:mahool/utils/widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => Container(
          child: ListView(
            children: [
              SizedBox(height: 70,),
              Center(
                child: Text(
                  "Please join us",
                  style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontSize: 30,fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 100,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:25,left: 0.0,right: 20),
                  child: Text(
                    "Please enter your number",
                    style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontSize: 17,fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left:60,right: 60,top: 0,bottom: 20),
                child:Theme(
                  data: Theme.of(context).copyWith(primaryColor: notifier.darkTheme ? Colors.white :primary),
                  child: IntlPhoneField(
                    style: TextStyle(
                        color: notifier.darkTheme ? Colors.white :primary
                    ),
                    dropDownArrowColor: notifier.darkTheme ? Colors.white :primary,
                    countryCodeTextColor: notifier.darkTheme ? Colors.white :primary,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: notifier.darkTheme ? Colors.white :primary),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: notifier.darkTheme ? Colors.white :primary),
                      ),
                      focusColor: notifier.darkTheme ? Colors.white :primary,
                      hoverColor: notifier.darkTheme ? Colors.white :primary,
                      fillColor: notifier.darkTheme ? Colors.white :primary,
                      hintStyle: TextStyle(
                          color: notifier.darkTheme ? Colors.white :primary
                      ),
                      labelText: 'Enter your mobile number',
                      labelStyle: TextStyle(
                        color: notifier.darkTheme ? Colors.white :primary,
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      phoneNumber = phone.completeNumber;
                    },
                  ),
                ),
              ),
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
                      child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                    color: primary,
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verification()));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
