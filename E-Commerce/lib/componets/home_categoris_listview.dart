import 'package:flutter/material.dart';

class HomeCategioris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Category"),
        ),
        Container(
          height: 80.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Category(
                  image_location: "assets/images/cats/tshirt.png",
                  image_caption: "shirt"),
              Category(
                  image_location: "assets/images/cats/dress.png",
                  image_caption: "dress"),
              Category(
                  image_location: "assets/images/cats/jeans.png",
                  image_caption: "Pants"),
              Category(
                  image_location: "assets/images/cats/formal.png",
                  image_caption: "formal"),
              Category(
                  image_location: "assets/images/cats/informal.png",
                  image_caption: "informal"),
              Category(
                  image_location: "assets/images/cats/shoe.png",
                  image_caption: "shoe"),
              Category(
                  image_location: "assets/images/cats/accessories.png",
                  image_caption: "Accessories"),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    this.image_location,
    this.image_caption,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: new ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 100.0 / 1.7,
            ),
            subtitle: Container(
              padding: const EdgeInsets.all(2.0),
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
