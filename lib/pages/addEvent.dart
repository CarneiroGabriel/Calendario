import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage(this.eventDay, {Key? key}) : super(key: key);
  DateTime eventDay;

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 32,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Titulo do Evento',
              ),
            ),
            TextField(
              controller: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Subtitulo do Evento',
              ),
            ),
            ElevatedButton.icon(onPressed: _openTimePickerSheet, icon: Icon(Icons.access_time), label: Text("Hora Inicial"))
          ],
        ),
      ),
    );
  }

  void _openTimePickerSheet() async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );

    if (result != null) {
      setState(() {
        widget.eventDay = result;
      });
    }
  }
}
