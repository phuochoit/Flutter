import 'package:bicycle_app_ui_concept/utils/customIcons.dart';

import '../utils/style.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail(this.product);
  final product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "bg",
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFFC5C5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 35, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 18, top: 50, bottom: 20, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.type,
                          style: AppStyle.appbarStyle,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CustomIcons.cart,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Hero(
                      tag: product.name,
                      child: Image.asset(
                        product.imgUrl,
                        width: 280,
                        height: 250,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    product.name,
                    style: AppStyle.headingStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: AppStyle.descStyle,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$${product.price}",
                        style: AppStyle.headingStyle,
                      ),
                      FlatButton(onPressed: (){}, child: Text("Add to cart".toUpperCase(), style: AppStyle.flatButtonStyle,))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
