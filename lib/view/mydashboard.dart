import 'package:first_app_2025_esilv/controller/global.dart';
import 'package:first_app_2025_esilv/view/myBackground.dart';
import 'package:flutter/material.dart';

class MyDasgBoard extends StatefulWidget {
  const MyDasgBoard({super.key});

  @override
  State<MyDasgBoard> createState() => _MyDasgBoardState();
}

class _MyDasgBoardState extends State<MyDasgBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.33,
        color: Colors.amber,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MyBackground(),
          Center(
            child: Text(
              moi.nom,
              style: TextStyle(color: Colors.pink),
            ),
          )
        ],
      ),
    );
  }
}
