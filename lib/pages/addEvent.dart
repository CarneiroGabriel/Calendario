import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage(this.eventDay, {Key? key}) : super(key: key);
  DateTime eventDay;
  String diaHora = "";


  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final subTitle = TextEditingController();
    String resultado = widget.eventDay.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 32,
        iconTheme: IconThemeData(color: Colors.black),
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
              controller: subTitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Subtitulo do Evento',
              ),
            ),
            ElevatedButton.icon(
                onPressed: _openTimePickerSheet,
                icon: Icon(Icons.access_time),
                label: Text("Hora do Evento")),
            Text(widget.diaHora)
          ],
        ),
      ),
    );
  }

  void _openTimePickerSheet() async {
    var result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Selecione a Hora Inicial',
        minuteTitle: 'Minuto',
        hourTitle: 'Hora',
        saveButtonText: 'Save',
        minuteInterval: 1,
        saveButtonColor: Colors.blueAccent,
        sheetTitleStyle: TextStyle(
          color: Colors.black,
          fontSize: 26,
        ),
        minuteTitleStyle: TextStyle(
          color: Colors.blueAccent,
        ),
        hourTitleStyle: TextStyle(
          color: Colors.blueAccent,
        ),
        wheelNumberSelectedStyle: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        result = new DateTime(widget.eventDay.year,widget.eventDay.month, widget.eventDay.day, result!.hour, result!.minute  );
        widget.diaHora = result.toString();
      });
    }
  }
}
