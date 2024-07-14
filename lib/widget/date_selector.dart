import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime currentDate = DateTime.now();
  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('bn');
    _generateDates();
  }

  void _generateDates() {
    for (int i = -3; i <= 3; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
  }

  String convertToBengaliNumerals(int number) {
    final numerals = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((digit) => numerals[int.parse(digit)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:20.0,bottom: 20),
        child: SizedBox(
          height: 75,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              bool isSelected = dates[index].day == currentDate.day &&
                  dates[index].month == currentDate.month &&
                  dates[index].year == currentDate.year;

              String dayInBengali = convertToBengaliNumerals(dates[index].day);
              String weekDayInBengali = DateFormat.E('bn').format(dates[index]);

              return Container(
                width: 50,
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF437b4d) : Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDayInBengali,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:  Colors.black.withOpacity(0.5),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Text(
                      dayInBengali,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}