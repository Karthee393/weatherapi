import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather/app/services/services.dart';
import 'package:open_weather/app/state/state_manager.dart';
import 'package:open_weather/app/ui/screen/search_weather.dart';
import 'package:open_weather/app/ui/screen/all_city_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Weather App',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (Context) => SearchCity())),
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more),
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Consumer(
              builder: ((context,
                  T Function<T>(ProviderBase<Object, T> provider) watch,
                  child) {
                return Expanded(
                    child: watch(cityDetailsStateFuture).data == null
                        ? Center(
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : ListView.builder(
                            itemCount: watch(cityDetailsStateFuture)
                                    .data
                                    ?.value
                                    ?.list
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    splashColor: Colors.grey,
                                    child: HomeTileView(
                                      weight: w,
                                      cityName: watch(cityDetailsStateFuture)
                                          .data
                                          .value
                                          .list
                                          .elementAt(index)
                                          .cityName
                                          .toString(),
                                      cityTemp: watch(cityDetailsStateFuture)
                                          .data
                                          .value
                                          .list
                                          .elementAt(index)
                                          .temp
                                          .toString(),
                                      cityStatus: watch(cityDetailsStateFuture)
                                          .data
                                          .value
                                          .list
                                          .elementAt(index)
                                          .status
                                          .toString(),
                                    ),
                                    onTap: () {
                                      fetchWeatherDetails(
                                          watch(cityDetailsStateFuture)
                                              .data
                                              .value
                                              .list
                                              .elementAt(index)
                                              .cityCode
                                              .toString(),
                                          context);
                                    },
                                  )
                                ],
                              );
                            }));
              }),
            ))
          ],
        ));
  }
}
