import 'package:flutter/material.dart';
import 'package:softbd/pages/todo_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../widget/date_selector.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.npoint.io/bc69ae1f6991da81ab9a'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void addNewTodo(Map<String, dynamic> newTodo) {
    setState(() {
      data.add(newTodo);
    });
  }

  String getTodayDateInBengali() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM').format(now);
    return convertToBengali(formattedDate);
  }

  String convertToBengali(String input) {
    const englishToBengali = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
      'January': 'জানুয়ারি',
      'February': 'ফেব্রুয়ারি',
      'March': 'মার্চ',
      'April': 'এপ্রিল',
      'May': 'মে',
      'June': 'জুন',
      'July': 'জুলাই',
      'August': 'আগস্ট',
      'September': 'সেপ্টেম্বর',
      'October': 'অক্টোবর',
      'November': 'নভেম্বর',
      'December': 'ডিসেম্বর'
    };
    englishToBengali.forEach((key, value) {
      input = input.replaceAll(key, value);
    });
    return input;
  }

  String formatTimeToBengali(DateTime dateTime) {
    String period = DateFormat('a', 'bn').format(dateTime);
    String formattedTime = DateFormat('h:mm', 'bn').format(dateTime);

    if (period == 'AM') {
      period = 'সকাল';
    } else if (period == 'PM') {
      period = 'বিকাল';
    }

    return '$formattedTime মি.';
  }

  String formatTimeToBangla(DateTime dateTime) {
    String period = DateFormat('a', 'bn').format(dateTime);
    String formattedTime = DateFormat('h:mm', 'bn').format(dateTime);

    if (period == 'AM') {
      period = 'সকাল';
    } else if (period == 'PM') {
      period = 'বিকাল';
    }

    return '$period \n$formattedTime মি.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সময়রেখা'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'icons/Group 1000002232.png',
              height: 40,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'আজ, ${getTodayDateInBengali()}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TodoPage()),
                          );

                          if (result != null) {
                            addNewTodo(result);
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF72a35a),
                                Color(0xFF437b4d),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'নতুন যোগ করুন',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const DateSelector()
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey.shade100,
                    child: data.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              DateTime dateTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(data[index]['date']) * 1000);
                              String formattedTime =
                                  formatTimeToBangla(dateTime);
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 40.0, bottom: 20),
                                child: Text(
                                  formattedTime,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            },
                          ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: data.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime =
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(data[index]['date']) * 1000);
                            String formattedTime = formatTimeToBangla(dateTime);
                            List<LinearGradient> gradients = [
                              const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF72a35a), Color(0xFF437b4d)],
                              ),
                              const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.black, Colors.grey],
                              ),
                            ];
                            LinearGradient currentGradient =
                                gradients[index % gradients.length];

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                gradient: currentGradient,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: ListTile(
                                title: Text(
                                  '$formattedTime',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]['name'],
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('${data[index]['category']}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('${data[index]['location']}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
