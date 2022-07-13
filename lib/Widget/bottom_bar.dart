import 'package:agendamento/pages/add.dart';
import 'package:flutter/material.dart';

import '../pages/calendar.dart';
import '../pages/homePage.dart';
import '../pages/list_events.dart';

FloatingActionButtonCustom(BuildContext context) {

  return FloatingActionButton(
    //Floating action button on Scaffold
    backgroundColor: Color(0XFFD5D5D5FF),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddPage()));
    },
    child: Icon(Icons.add, size: 35, color: Colors.black,), //icon inside button
  );
}

CenterActionButton() => FloatingActionButtonLocation.centerDocked;

BottomNavBar(BuildContext context) {
  return BottomAppBar(
    color: Color(0XFFD5D5D5FF),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_month_sharp,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalendarPage()));
          },
          padding: EdgeInsets.only(right: 20),
        ),
        IconButton(
          icon: Icon(
            Icons.list,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TableEventsExample()));
          },
          padding: EdgeInsets.only(left: 20),
        ),
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            /*
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfessorPage()));*/
          },
        ),
      ],
  )
  );
}