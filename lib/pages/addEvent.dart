import 'package:flutter/material.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage(this.eventDay, {Key? key}) : super(key: key);
  DateTime eventDay;
  String diaHora = "";
  String diaHorafinal = "";



  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final subTitle = TextEditingController();

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
                onPressed: inicialTimePickerSheet,
                icon: Icon(Icons.access_time),
                label: Text("Hora do Evento")),
            Text(widget.diaHora),
            Text(widget.diaHorafinal)
          ],
        ),
      ),
    );
  }

  void inicialTimePickerSheet() async {
    var inicialTime = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Selecione a Hora Inicial',
        minuteTitle: 'Minuto',
        hourTitle: 'Hora',
        saveButtonText: 'Salvar',
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

    if (inicialTime != null) {
      setState(() {
        widget.eventDay = DateTime(
            widget.eventDay.year, widget.eventDay.month, widget.eventDay.day,
            inicialTime.hour, inicialTime.minute);
        widget.diaHora = widget.eventDay.toString();
      });
      finalTimePickerSheet();
    }
  }

  void finalTimePickerSheet() async {
    var finalTime = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Selecione a Hora Final',
        minuteTitle: 'Minuto',
        hourTitle: 'Hora',
        saveButtonText: 'Salvar',
        minuteInterval: 1,
        initialDateTime: widget.eventDay,
        minHour: widget.eventDay.hour,
        minMinute: widget.eventDay.minute,
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

    if (finalTime != null) {
      setState(() {
        finalTime = DateTime(
            widget.eventDay.year, widget.eventDay.month, widget.eventDay.day,
            finalTime!.hour, finalTime!.minute);
        widget.diaHorafinal = finalTime.toString();
      });
    }
  }
}
