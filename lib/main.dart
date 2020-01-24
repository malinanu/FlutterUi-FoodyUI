import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FoodDetails.dart';
import 'data/dataItems.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Foody UI',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Healthy',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    ' Food',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) => InkWell(
                            child: buildItem(
                              ui2path[index % ui2path.length],
                              ui2names[index % ui2path.length],
                              ui2price[index % ui2path.length],
                              index,
                              MediaQuery.of(context).size.height * 0.1,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsFoody(
                                  ui2path[index % ui2path.length],
                                  '$index',
                                  ui2names[index % ui2path.length],
                                  ui2price[index % ui2path.length],
                                ),
                              ),
                            ),
                          ),
                          itemCount: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.black12.withOpacity(0.1),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: FlatButton(
                                splashColor: Colors.indigoAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black26),
                                ),
                                child: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: FlatButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black26),
                                ),
                                splashColor: Colors.indigoAccent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Icon(Icons.shopping_cart),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          '2',
                                          style: GoogleFonts.montserrat(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: FlatButton(
                                  color: Color(0xFF1C1428),
                                  splashColor: Colors.indigoAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      'Checkout',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildItem(
    String imgPath, String name, double price, int index, double height) {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: height,
              width: height,
              child: Hero(
                tag: imgPath + '$index',
                child: CachedNetworkImage(
                  imageUrl: imgPath,
                  imageBuilder: (context, image) {
                    return Container(
                      height: height,
                      width: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(image: image, fit: BoxFit.cover),
                      ),
                    );
                  },
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$$price',
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        )
      ],
    ),
  );
}
