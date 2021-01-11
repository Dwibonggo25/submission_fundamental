import 'package:flutter/material.dart';
import 'package:fundamental_submission1/model/restaurant.dart';
import 'package:fundamental_submission1/widget/detailrestaurantscreen.dart';

class HomeScreen extends StatefulWidget {


  static const routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget _buildResturantItem (BuildContext context, Restaurant restaurant) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Row (
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
            tag: restaurant.id,
            child: Image.network(
              restaurant.pictureId,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            )),
        SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              restaurant.city,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            Container(
              height: 12,
              width: MediaQuery.of(context).size.width/2,
              child: Text(
                restaurant.rating.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            )
          ],
        )
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding (
            padding: EdgeInsets.all(16.0),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearch(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Restaurant",
                  style: TextStyle (
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "Recomended restauran for you",
                  style: TextStyle (
                      fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder<String>(
                    future:
                    DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
                    builder: (context, snapshot) {
                      final List<Restaurant> restaurant = parseArticles(snapshot.data);
                      return ListView.builder(
                        itemCount: restaurant.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, DetailResturant.routeName, arguments: restaurant[index]);
                            },
                            child: _buildResturantItem(context, restaurant[index]),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
      )
    );
  }

  Widget _buildSearch () {
    return TextField(
      decoration: InputDecoration (
        prefixIcon: Icon(Icons.search),
        hintText: "Cari Restaurant terdekat",
        labelText: "Cari",
        fillColor: Colors.grey,
        prefixStyle: TextStyle (color: Colors.black, fontWeight: FontWeight.w600)
      ),
      onChanged: (value) {
      },
    );
  }
}
