import 'package:flutter/material.dart';
import 'package:softbd/pages/square.dart';
import '../widget/item_widget.dart';

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            child: Image.asset(
                              'icons/placeholder1.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'মোঃ মোহাইমেনুল রেজা',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              const Text(
                                'সফটবিডি লিমিটেড',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                children: [
                                  Image.asset(
                                    'icons/Map Point.png',
                                    width: 25.0,
                                    height: 25.0,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 6.0),
                                  const Text(
                                    'ঢাকা',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 180,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'সময় অতিবাহিত',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'মেয়াদকাল',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'icons/calender.png',
                              height: 20,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              '১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'আরও বাকি',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SquareBox(text: "০"),
                            SquareBox(text: "৫"),
                            SquareBox(text: "০"),
                            SquareBox(text: "৬"),
                            SquareBox(text: "১"),
                            SquareBox(text: "২"),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'বছর',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'মাস',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'দিন',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemWidget(
                        imagePath: 'icons/Frame(1).png',
                        text1: 'মেনু নং',
                        text2: '০০০০১'),
                    ItemWidget(
                        imagePath: 'icons/Frame(2).png',
                        text1: 'মেনু নং',
                        text2: '০০০০২'),
                    ItemWidget(
                        imagePath: 'icons/Frame(3).png',
                        text1: 'মেনু নং',
                        text2: '০০০০৩'),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemWidget(
                        imagePath: 'icons/Frame(4).png',
                        text1: 'মেনু নং',
                        text2: '০০০০৪'),
                    ItemWidget(
                        imagePath: 'icons/Frame(5).png',
                        text1: 'মেনু নং',
                        text2: '০০০০৫'),
                    ItemWidget(
                        imagePath: 'icons/Frame(6).png',
                        text1: 'মেনু নং',
                        text2: '০০০০৬'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
