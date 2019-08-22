import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'data.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff696d77), Color(0xff292c36)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: screenAwareSize(20.0, context),
                ),
                onPressed: () {}),
            title: Text(
              "Energy Cloud",
              style: titleheading(18.0, context),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: screenAwareSize(20.0, context),
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
          ),
          body: Column(
            children: <Widget>[
              ProductScreenTopPart(),
              ProductScreenBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(280.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/adidas.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, right: 35.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Image.asset("assets/360.png"),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rating",
                  style: title(10.0, context),
                ),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffffe600),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "4.5",
                      style: descStyle(Color(0xffffe600), 14.0, "", context),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      "(378 People)",
                      style: descStyle(Color(0xffffe600), 14.0, "", context),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentIndexSize, _counter = 0;
//  int  = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _setIndex(int index) {
    setState(() {
      currentIndexSize = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text("Product Description", style: title(10.0, context)),
          ),
          SizedBox(height: screenAwareSize(8.0, context)),
          Padding(
            padding: EdgeInsets.only(
                right: screenAwareSize(18.0, context),
                left: screenAwareSize(26.0, context)),
            child: AnimatedCrossFade(
                firstChild: Text(
                  desc,
                  maxLines: 2,
                  style: descStyle(
                      Colors.white, 10.0, "Montserrat-Medium", context),
                ),
                secondChild: Text(
                  desc,
                  style: descStyle(
                      Colors.white, 10.0, "Montserrat-Medium", context),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: screenAwareSize(18.0, context),
                left: screenAwareSize(26.0, context)),
            child: GestureDetector(
              child: Text(
                isExpanded ? "less" : "more..",
                style: descStyle(
                    Color(0xfffb382f), 10.0, "Montserrat-Bold", context),
              ),
              onTap: _expand,
            ),
          ),
          SizedBox(
            height: screenAwareSize(12.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18.0, context),
              right: screenAwareSize(75.0, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: title(10.0, context),
                ),
                Text(
                  "Quantity",
                  style: title(10.0, context),
                )
              ],
            ),
          ),
          SizedBox(height: screenAwareSize(8.0, context)),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          _setIndex(index);
                        },
                        child: sizeItem(item,
                            index == currentIndexSize ? true : false, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenAwareSize(20.0, context),
                    right: screenAwareSize(20.0, context)
                  ),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    decoration: BoxDecoration(
                      color: Color(0xff525663),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                            flex: 3,
                            child: GestureDetector(
                              onTap: _decrease,
                              child: Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text("-",
                                      style: descStyle(Colors.white, 17.0,
                                          "Montserrat-SemiBold", context)),
                                ),
                              ),
                            )),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(_counter.toString(),
                                  style: descStyle(Colors.white, 17.0,
                                      "Montserrat-SemiBold", context)),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                            flex: 3,
                            child: GestureDetector(
                              onTap: _increase,
                              child: Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text("+",
                                      style: descStyle(Colors.white, 17.0,
                                          "Montserrat-SemiBold", context)),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
          ),
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: screenAwareSize(10.0, context),
    ),
    child: Container(
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xfffc3930) : Color(0xff525663),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0)
          ]),
      child: Center(
          child: Text(
        size,
        style: descStyle(Colors.white, 12.0, "Montserrat-Bold", context),
      )),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}


// https://youtu.be/dMLreUXpSQ0?t=560