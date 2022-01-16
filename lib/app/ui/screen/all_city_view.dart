import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTileView extends StatefulWidget {
  final double weight;
  final String cityName;
  final String cityStatus;
  final String cityTemp;

  HomeTileView({this.weight, this.cityName, this.cityStatus, this.cityTemp});

  @override
  _HomeTileViewState createState() => _HomeTileViewState();
}

class _HomeTileViewState extends State<HomeTileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        // alignment: Alignment.centerLeft,
        // color: Colors.grey,
        width: 700,
        height: 200.0,
        child: Container(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 15.0,
              child: Column(
                children: [
                  Expanded(
                    child: Text(widget.cityName,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    // flex: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.cityStatus,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.cityStatus == "Clouds")
                        Image.asset(
                          'assets/sunny_2d.png',
                          height: 100,
                          width: 100,
                        )
                      else if (widget.cityStatus == "Clear")
                        Image.asset(
                          'assets/sunny.png',
                          height: 100,
                          width: 100,
                        )
                      else if (widget.cityStatus == "Rain")
                        Image.asset(
                          'assets/rainy.png',
                          height: 100,
                          width: 100,
                        )
                    ],
                  ),
                  Expanded(
                    child: Text(
                      widget.cityTemp + ' \u2109',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )),
        ));
  }
}
