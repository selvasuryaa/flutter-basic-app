import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String contents;

  DetailScreen({required this.contents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item 1 ')),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(100, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(5),
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  'Item $index',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
