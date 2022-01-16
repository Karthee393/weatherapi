import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/app/services/services.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({Key key}) : super(key: key);

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController _cityTextController = TextEditingController();
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Enter the City")),
      body: Form(
          child: Row(children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextFormField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                        labelText: 'Enter a city Id',
                        hintText: 'Example:1248991')))),
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              fetchWeatherDetails(_cityTextController.text.toString(), context);
            })
      ])),
    );
  }
}
