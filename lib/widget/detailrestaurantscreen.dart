import 'package:fundamental_submission1/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailResturant extends StatefulWidget {

  static const routeName = "/detailrestaurant";
  @override
  _DetailResturantState createState() => _DetailResturantState();
}

class _DetailResturantState extends State<DetailResturant> {

  @override
  Widget build(BuildContext context) {
    final Restaurant data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar (
        title: Text (data.name),
      ),
      body: SingleChildScrollView (
        child: Stack (
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding (
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      data.pictureId,
                      height: 250 ,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Text(
                      data.name,
                      style: TextStyle (
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      data.description,
                      maxLines: 2,
                      style: TextStyle (
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
