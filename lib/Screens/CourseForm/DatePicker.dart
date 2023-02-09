
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {

  DatePicker(){}
  @override
  _State createState() => _State();
}

class _State extends State<DatePicker> {

  String _value = '';

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2099)
    );
    if(picked != null) setState(() => _value = picked.toString());

  }
  String _selectedTime='';

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select course date '),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_value),
                  Text(_selectedTime)
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: _selectDate, child: Text('Choose date and time'),),
                  SizedBox(height: 20,),
               ElevatedButton(
                  onPressed: _show, child: const Text('Show Time Picker')),
                ],
              ),
            ),
          )
      ),
    );
  }
}
