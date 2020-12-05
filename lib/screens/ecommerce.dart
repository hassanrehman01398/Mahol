import 'package:flutter/material.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/screens/plant_detail.dart';
import 'package:mahool/utils/theme.dart';
import 'package:provider/provider.dart';

class Ecommerce extends StatefulWidget {
  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  List fertilizer = [
    {
      'name': 'Urea',
      'pic': 'https://www.researchgate.net/profile/Chigozie_Uzoh/publication/328500885/figure/fig1/AS:689910956695554@1541498998544/Granular-urea-fertilizer.jpg',
    },
    {
      'name': 'NPK',
      'pic': 'https://tiimg.tistatic.com/fp/1/003/983/npk-fertilizer-374.jpg',
    },
    {
      'name': 'Limestone',
      'pic': 'https://i.pinimg.com/564x/c4/52/55/c45255a248938366575f64f6989dba65.jpg',
    },
    {
      'name': 'Sodium nitrate',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Dusi%C4%8Dnan_sodn%C3%BD.JPG',
    },
    {
      'name': 'Ammonium sulphate',
      'pic': 'https://5.imimg.com/data5/SELLER/Default/2020/10/PV/XE/YF/14550721/ammonium-sulphate-500x500.jpg',
    },
    {
      'name': 'Ammonium nitrate',
      'pic': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Ammonium_nitrate_CN.JPG/1024px-Ammonium_nitrate_CN.JPG',
    }
  ];
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
        builder: (context,notifier,child) => Column(
          children: [
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Text("Fertilizers",style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.w900,fontSize: 15),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:35.0,right: 35.0),
              child: Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fertilizer.length,
                    itemBuilder: (context,index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: primary,
                        child: CircleAvatar(
                            backgroundColor: primary,
                            radius: 27,
                            backgroundImage: NetworkImage(fertilizer[index]['pic'])
                        ),
                      ),
                    )
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Text("Buy Plants",style: TextStyle(color: notifier.darkTheme ? Colors.white :primary,fontWeight: FontWeight.w900,fontSize: 15),),
              ],
            ),
            Expanded(
              child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
                itemCount: plants.length,
                itemBuilder:(cyx,index){
                  return WidgetAnimator(
                    GestureDetector(
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 12,),
                            Image.network(plants[index]['pic'],height: 100,width: 100,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                                ),
                                width: double.infinity,
                                child: Center(child: Text(plants[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,color: ascent,fontSize: 12),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
