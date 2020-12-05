import 'package:flutter/material.dart';
import 'package:mahool/utils/theme.dart';
import 'package:mahool/utils/widgets.dart';
import 'package:provider/provider.dart';

class PlantDetail extends StatefulWidget {
  final String name;
  final String pic;
  final String price;
  final String description;

  const PlantDetail({Key key, this.name, this.pic, this.price, this.description}) : super(key: key);
  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
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
                  child: new RaisedButton.icon(
                    icon: Icon(Icons.shopping_cart),
                    label: new Text("Buy"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {

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
                  child: new RaisedButton.icon(
                    icon: Icon(Icons.favorite),
                    label: Text("Like"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) => ListView(
          children: [
            Image.network(widget.pic),
            SizedBox(height: 10,),
            Text(widget.name,style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text("Rs ${widget.price}",style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description,style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontSize: 15),textAlign: TextAlign.center,),
            ),
            _getActionButtons(),
          ],
        )
      )
    );
  }
}
