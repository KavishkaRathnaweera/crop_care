import 'package:cropcare/utils/carousal_items.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/harvest.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       primary: Colors.green[900],
                      //       minimumSize: const Size.fromHeight(60),
                      //       elevation: 5),
                      //   onPressed: () {
                      //     Get.toNamed('/farmerReportIncident');
                      //   },
                      //   child: const Text(
                      //     "REPORT INCIDENT",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 15),
                            autoPlayCurve: Curves.decelerate,
                            viewportFraction: 1.0,
                          ),
                          items: adCarousal.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        const BoxDecoration(color: Colors.amber),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: i.image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                height: 250,
                                                width: double.infinity,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            // TODO: fix overflow on registration path
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: const [
                                                    Text(
                                                      "Ad",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        i.title,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          i.description,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: null,
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w300,
                                                              color: Color.fromARGB(
                                                                  255, 63, 62, 62)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  child: const Text("Read more..."),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
