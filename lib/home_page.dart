import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/get_location.dart';
import 'package:weather_app_2/weather_data.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var client = WeatherData();
  var data;

  information() async {
    // var position = await getPosition();
    data = await client.getData(-11, 55);
    return data;
  }
  //builder: ((context, snapshot){
  // }),
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: information(),
        builder: ((context, snapshot){
          return Container(
            child: Column(
              children: [
                Container(

                  height: size.height * 0.75,
                  width: size.width,
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff955cd1),
                        Color(0xff3fa2fa),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${data?.cityName}",
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'MavenPro',
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        dateFormat,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      // Image.asset(
                      //   "assets/images/sunny.png",
                      //   width: size.width * 0.4,
                      // ),
                      Image.network('https:${data?.icon}',width: size.width*0.35,fit: BoxFit.fill,),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data?.condition}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hubballi',
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${data?.temp} ^",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hubballi',
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/storm.png",
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  "${data?.wind} km/h",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "wind",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/humidity.png",
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  "${data?.humidity}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/wind-direction.png",
                                  width: size.width * 0.15,
                                ),
                                Text(
                                  "${data?.wind_dir}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "wind-direction",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'MavenPro',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Gust",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.gust} kh/h",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "pressure",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.pressure} hpa",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "UV",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.uv}",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "precipitation",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.pricipe} mm",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Wind",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.wind} km/h",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Last Update",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${data?.last_update}",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
