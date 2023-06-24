import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Widgets/item_view.dart';
import '../../Styles/color.dart';

class AccesoriesPage extends StatefulWidget {
  const AccesoriesPage({Key? key}) : super(key: key);

  @override
  State<AccesoriesPage> createState() => _AccesoriesPageState();
}

class _AccesoriesPageState extends State<AccesoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Accessories'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: bgWhite,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return ItemView(
                          currentIndex: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
