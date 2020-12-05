import 'package:flutter/material.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/screens/plant_detail.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List plants = [
    {
      'name': 'Adam\'s Needle Plant',
      'pic': 'https://www.thespruce.com/thmb/2B3mRYwMPeC9IXV2yqYMWLNe4nE=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/adams-needle-yucca-filamentosa-2131814-03-341c2a69afe6433caebc427e314f50cf.jpg',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Neem',
      'pic': 'https://nurserynisarga.in/wp-content/uploads/2019/09/Neem.jpg',
      'price': 100.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Aloe vera',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Aloe_vera_flower_inset.png/260px-Aloe_vera_flower_inset.png',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Chamaedorea elegans',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Chamaedorea_elegans_Mart.JPG/1024px-Chamaedorea_elegans_Mart.JPG',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Devil\'s ivy',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Epipremnum_aureum_31082012.jpg/1024px-Epipremnum_aureum_31082012.jpg',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Dracaena trifasciata',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Snake_Plant_%28Sansevieria_trifasciata_%27Laurentii%27%29.jpg',
      'price': 600.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Chrysanthemums',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Chrysanthemum_November_2007_Osaka_Japan.jpg',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
    {
      'name': 'Rubber Plant',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Ficus_elastica_leaves_02.JPG/1024px-Ficus_elastica_leaves_02.JPG',
      'price': 200.0,
      'description': 'Adam\'s needle (Yucca filamentosa) is a broadleaf evergreen shrub that is often used in Southwest themed landscapes, event though it is native to the Southeast U.S. Adam\'s needle is related to many other commonly grown cacti and succulents, and the family to which it belongs reveals another surprising relative—asparagus.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,notifier,child) =>  ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context,index) => WidgetAnimator(
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 4),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => PlantDetail(
                      name: plants[index]['name'],
                      pic: plants[index]['pic'],
                      description: plants[index]["description"],
                      price: plants[index]["price"].toString(),
                    )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: primary,
                        child: CircleAvatar(
                            backgroundColor: primary,
                            radius: 27,
                            backgroundImage: NetworkImage(plants[index]['pic'])
                        ),
                      ),
                      title: Text(plants[index]['name'],style: TextStyle(color: notifier.darkTheme ? Colors.white :primary),),
                      subtitle: Text(plants[index]['price'].toString(),style: TextStyle(color: notifier.darkTheme ? Colors.white :primary),),
                      trailing: Icon(Icons.favorite,color: Colors.red,),
                    ),
                  ),
                ),
              ),
            )
        ),
      )
    );
  }
}
