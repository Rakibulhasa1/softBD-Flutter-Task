import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _category = '';
  String _location = '';
  DateTime _date = DateTime.now();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('https://api.npoint.io/bc69ae1f6991da81ab9a'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "name": _name,
          "category": _category,
          "location": _location,
          "date": (_date.millisecondsSinceEpoch / 1000).round().toString(),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todo added successfully')));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to add todo')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন যোগ করুন'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildLabeledField('অনুচ্ছেদ', 'অনুচ্ছেদ লিখুন', (value) {
                  if (value == null || value.isEmpty) {
                    return 'অনুচ্ছেদ লিখুন';
                  }
                  return null;
                }, (value) {
                  _name = value!;
                }),
                const SizedBox(height: 16),
                buildLabeledField('অনুচ্ছেদের বিভাগ', 'অনুচ্ছেদের বিভাগ নির্বাচন করুন', (value) {
                  if (value == null || value.isEmpty) {
                    return 'অনুচ্ছেদের বিভাগ নির্বাচন করুন';
                  }
                  return null;
                }, (value) {
                  _category = value!;
                }),
                const SizedBox(height: 16),
                buildLabeledDateField('তারিখ ও সময়'),
                const SizedBox(height: 16),
                buildLabeledField('স্থান', 'নির্বাচন করুন', (value) {
                  if (value == null || value.isEmpty) {
                    return 'নির্বাচন করুন';
                  }
                  return null;
                }, (value) {
                  _location = value!;
                }),
                const SizedBox(height: 16),
                buildLabeledField('অনুচ্ছেদের বিবরণ', 'কার্যক্রমের বিবরণ লিখুন', (value) {
                  if (value == null || value.isEmpty) {
                    return 'কার্যক্রমের বিবরণ লিখুন';
                  }
                  return null;
                }, null),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF72a35a),
                          Color(0xFF437b4d),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'সংরক্ষন করুন',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabeledField(String labelText, String hintText, FormFieldValidator<String> validator, FormFieldSetter<String>? onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 12,
            color: Color(0xFF353B50),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(22.0),
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLabeledDateField(String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 12,
            color: Color(0xFF353B50),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null && pickedDate != _date) {
                setState(() {
                  _date = pickedDate;
                });
              }
            },
            controller: TextEditingController(text: DateFormat('yyyy-MM-dd').format(_date)),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(22.0),
              border: InputBorder.none,
              hintText: 'তারিখ ও সময় নির্বাচন করুন',
            ),
          ),
        ),
      ],
    );
  }
}
