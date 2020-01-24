import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsFoody extends StatefulWidget {
  final imgPath;
  final tag;
  final name;
  final price;
  DetailsFoody(this.imgPath, this.tag, this.name, this.price);

  @override
  _DetailsFoodyState createState() => _DetailsFoodyState();
}

class _DetailsFoodyState extends State<DetailsFoody> {
  String selected = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        backgroundColor: Color(0xFF7A9BEE),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          )
        ],
        title: Text(
          'Details',
          style: GoogleFonts.roboto(fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: constraints.maxHeight * 0.12,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90.0),
                      topRight: Radius.circular(90.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: constraints.maxWidth / 2 - 100,
                child: Hero(
                  tag: widget.imgPath + widget.tag,
                  child: Container(
                    height: constraints.maxHeight * 0.3,
                    width: constraints.maxHeight * 0.3,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: widget.imgPath,
                        imageBuilder: (context, image) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: image, fit: BoxFit.cover),
                            ),
                          );
                        },
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.3,
                width: constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 21.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            widget.name.toString().split(" ")[0],
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            ' Bowl',
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 21.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '\$${widget.price}',
                            style: GoogleFonts.montserrat(
                              fontSize: 25.0,
                              color: Colors.black38,
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.08,
                            width: constraints.maxWidth * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFF7A9BEE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  '-',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: constraints.maxHeight * 0.04),
                                ),
                                Text(
                                  '2',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: constraints.maxHeight * 0.04),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  width: constraints.maxWidth * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xFF7A9BEE),
                                          fontSize: constraints.maxHeight * 0.04),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.03,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildDetails('WEIGHT', '300', 'G', constraints.maxHeight * 0.04, constraints.maxWidth * 0.28),
                          SizedBox(width: 10.0),
                          _buildDetails('CALORIES', '267', 'CAL',constraints.maxHeight * 0.04, constraints.maxWidth * 0.28),
                          SizedBox(width: 10.0),
                          _buildDetails('VITAMINS', 'A, B6', 'VIT',constraints.maxHeight * 0.04, constraints.maxWidth * 0.28),
                          SizedBox(width: 10.0),
                          _buildDetails('AVAIL', 'NO', 'AV',constraints.maxHeight * 0.04, constraints.maxWidth * 0.28),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.04),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: constraints.maxHeight * 0.12,
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: FlatButton(
                            color: Color(0xFF1C1428),
                            splashColor: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(45.0),
                                bottomRight: Radius.circular(45.0),
                                topLeft: Radius.circular(22.0),
                                topRight: Radius.circular(22.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                '\$${widget.price}',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: constraints.maxHeight * 0.04),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetails(String title, String info, String unit, double height, double width) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: height,
        width: width,
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: title == selected ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: title == selected
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 15.0,
                  color: title == selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: title == selected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    unit,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: title == selected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
