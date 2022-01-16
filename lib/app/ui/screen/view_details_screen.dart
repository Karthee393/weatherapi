import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather/app/model/weather_model.dart';
import 'package:open_weather/app/ui/screen/home_screen.dart';

class ViewDetailsPage extends StatefulWidget {
  final WeatherModel cityCode;
  ViewDetailsPage({this.cityCode});

  @override
  _ViewDetailsPageState createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  final int time = 60;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        body: ListView(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: Colors.white,
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(12.0)),
            alignment: Alignment.center,
            height: 400.0,
            // color: Color(0xff00A1FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.cityCode.name,
                    style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text(
                    widget.cityCode.weather.elementAt(0).description.toString(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
                Center(
                  child: Image(
                    image: AssetImage("assets/sunny.png"),
                    height: 200,
                    width: 350,
                  ),
                ),
                Text(widget.cityCode.main.temp.toString() + ' \u2109',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
          ),
          Container(
              // alignment: Alignment.center,
              height: 300.0,
              // color: Color(0xff00A1FF),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView(children: [
                      ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.flag, color: Colors.purple),
                        title: Text("Country"),
                        trailing: Text(
                          widget.cityCode.sys.country.toString(),
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.cloud,
                            color: Colors.purple),
                        title: Text("Wind Speed"),
                        trailing: Text(
                          widget.cityCode.wind.speed.toString() + 'MPH',
                        ),
                      ),
                      ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.sun, color: Colors.purple),
                        title: Text("Sunset"),
                        trailing: Text(
                          widget.cityCode.sys.sunset.toString(),
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.thermometerHalf,
                            color: Colors.purple),
                        title: Text("Humidity"),
                        trailing: Text(
                          widget.cityCode.main.humidity.toString() + '%',
                        ),
                      )
                    ])
                        // flex: 2,
                        ),
                  ]))
        ]));
  }
}
