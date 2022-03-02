import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:address_picker/address_picker.dart';
import 'dart:convert';


class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TencentWeatherData();

}

class _TencentWeatherData extends State <WeatherContainer> {
  WeatherHeader weatherHeader = const WeatherHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 200,
      child:
      weatherHeader,
    );
  }
}

/// 显示位置角标和选择
class WeatherHeader extends StatefulWidget {
  const WeatherHeader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherCity();

}

class CommonModel {
  final dynamic data;
  CommonModel({this.data});
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      data: json['data']
    );
  }
}

class _WeatherCity extends State <WeatherHeader> {
  String city = '北京';
  List <String> addressList = ['北京市', '北京市', '朝阳区'];
  Map  weatherData = {};
  Uri url = Uri.parse('https://wis.qq.com/weather/common');

  Future <http.Response> getData() async {
    final res = await http.post(url, body: {
      'source': 'pc',
      'province': addressList[0],
      'city': addressList[1],
      'country': addressList[2],
      'weather_type': 'forecast_24h',
    });
    final data = json.decode(res.body);

    setState(() {
      weatherData = data;
    });
    print(weatherData);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          color: Colors.lightBlue,
          child: InkWell(
              // ignore: avoid_print
              onTap: () {
                Future futrue = showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                        onClosing: () {
                          getData();
                        },
                        builder: (context) => Container(
                          height: 250.0,
                          child: AddressPicker(
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            mode: AddressPickerMode.provinceCityAndDistrict,
                            onSelectedAddressChanged: (address) {
                              setState(() {
                                addressList[0] = address.currentProvince.province;
                                addressList[1] = address.currentCity.city;
                                addressList[2] = address.currentDistrict.area;
                              });
                              print('${address.currentProvince.province}');
                              print('${address.currentCity.city}');
                              print('${address.currentDistrict.area}');
                            },
                          ),
                        )));
                futrue.then((value) => getData());
                // showBottomSheet(context: context, builder: builder)
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Column(
                children: <Widget> [
                 Row(
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      addressList[2],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                  weatherData.isNotEmpty ?
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                            weatherData['data']['forecast_24h']['0']['time'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),
                        ),
                      ),
                      Text(
                          weatherData['data']['forecast_24h']['0']['day_weather'],
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white

                          ),
                      ),
                      Text(
                        weatherData['data']['forecast_24h']['0']['day_wind_direction']+'  '+weatherData['data']['forecast_24h']['0']['day_wind_power'] +'级',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white

                        ),
                      ),
                    ],
                  )
                      : const Text(
                      '暂无数据',
                      style:  TextStyle(
                        fontSize: 30,
                        color: Colors.white70
                      ),
                    )
                ],
              )
            ),

        ),
      ),
    );

  }
}
