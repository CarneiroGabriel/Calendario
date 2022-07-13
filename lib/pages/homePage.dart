import 'package:agendamento/Widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      label: Text("Pesquisar"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(40, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(16))
                      )
                    ),
                    onPressed: () {},
                    child: Icon(Icons.search,
                    size: 32,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonCustom(context),
      floatingActionButtonLocation: CenterActionButton(),
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}
