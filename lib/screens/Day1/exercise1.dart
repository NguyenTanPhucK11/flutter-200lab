import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class Exercise1 extends StatefulWidget {
  @override
  _Exercise1State createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  int segmentedControlValue = 0;
  int temperature = 0;
  var temperatureController = TextEditingController();
  var tempF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercise 1'),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: CupertinoSlidingSegmentedControl(
                groupValue: segmentedControlValue,
                backgroundColor: Colors.blue.shade200,
                children: const <int, Widget>{
                  0: Text('Độ F'),
                  1: Text('Độ C'),
                },
                onValueChanged: (value) {
                  setState(() {
                    segmentedControlValue = value;
                    temperatureController.text.isEmpty
                        ? tempF.text = "0"
                        : tempF.text = value == 0
                            ? ((int.parse(temperatureController.text) - 32) /
                                    1.8)
                                .toStringAsFixed(2)
                            : (int.parse(temperatureController.text) * 1.8 + 32)
                                .toStringAsFixed(2);
                  });
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 95,
                height: 70,
                child: TextField(
                  maxLength: 4,
                  maxLengthEnforced: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: temperature.toString(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: temperatureController,
                  onChanged: (value) {
                    value.isEmpty
                        ? tempF.text = "0"
                        : tempF.text = segmentedControlValue == 0
                            ? ((int.parse(value) - 32) / 1.8).toStringAsFixed(2)
                            : (int.parse(value) * 1.8 + 32).toStringAsFixed(2);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 95,
                height: 50,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: tempF,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
