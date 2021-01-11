import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  String rating;
  Menues menus;

  Restaurant ({this.id, this.name, this.description, this.pictureId, this.city, this.rating, this.menus});

  Restaurant.fromJson (Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant ['name'];
    description = restaurant ['description'];
    pictureId = restaurant ['pictureId'];
    city = restaurant ['city'];
    rating = restaurant ['rating'].toString();
    menus = restaurant ['menues'];
  }
}

class Menues {
  List<Drink> foods;
  List<Drink> drinks;

  Menues ({this.foods, this.drinks});

  Menues.fromJson (Map<String, dynamic> menues) {
    foods = menues ['foods'];
    drinks = menues ['drinks'];
  }
}

class Drink {
  String name;

  Drink ({this.name});

  Drink.fromJson (Map<String, dynamic> drink) {
    name = drink['name'];
  }
}

List<Restaurant> parseArticles(String json) {

  if (json == null) {
    return [];
  }

  final  Map<String,dynamic> parsed = jsonDecode(json);
  return parsed["restaurant"].map<Restaurant>((json) => Restaurant.fromJson(json)).toList() ;
}