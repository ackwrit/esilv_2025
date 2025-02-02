import 'package:first_app_2025_esilv/controller/global.dart';
import 'package:first_app_2025_esilv/controller/myFiresbaseHelper.dart';
import 'package:first_app_2025_esilv/view/allPersonn.dart';
import 'package:first_app_2025_esilv/view/mapView.dart';
import 'package:first_app_2025_esilv/view/myBackground.dart';
import 'package:first_app_2025_esilv/controller/loadingmap.dart';
import 'package:flutter/material.dart';

class MyDasgBoard extends StatefulWidget {
  const MyDasgBoard({super.key});

  @override
  State<MyDasgBoard> createState() => _MyDasgBoardState();
}

class _MyDasgBoardState extends State<MyDasgBoard> {
  //variable
  bool isChangePseudo = false;
  TextEditingController pseudoController = TextEditingController();
  int current = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.33,
        color: Colors.amber,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(moi.avatar!), fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 10),
          Text(moi.email),
          SizedBox(height: 10),
          Text(moi.prenom),
          SizedBox(height: 10),
          Text(moi.nom),
          SizedBox(height: 10),
          Row(children: [
            (isChangePseudo)
                ? Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                        controller: pseudoController,
                        decoration:
                            InputDecoration(hintText: "Entrer le pseudo")))
                : Text(moi.pseudo!),
            Spacer(),
            (isChangePseudo)?IconButton(
              onPressed: () {
                setState(() {



                      moi.pseudo = pseudoController.text;
                      Map<String, dynamic> data = {"PSEUDO": moi.pseudo};
                      MyFirebaseHelper().updateUser(moi.id, data);
                      isChangePseudo = false;

                      ///


                });
              },
              icon:Icon(Icons.check),
            ):IconButton(
                onPressed: (){
                  setState(() {
                    isChangePseudo = true;
                  });
                },
                icon: Icon(Icons.check)
            ),
          ])
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
          onTap: (tapped){
              setState(() {
                current = tapped;
              });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Personnes"
            ),
            BottomNavigationBarItem(
                label: "Cartes",
                icon: Icon(Icons.map)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
              label: "Paramètres"
            )
          ]
      ),
      body: Stack(
        children: [
          MyBackground(),
          bodyPage()

        ],
      ),
    );
  }

  Widget bodyPage(){
    switch (current) {
      case 0: return AllPerson();
      case 1 : return LoadingMap();
      case 2 : return Text("Paramètres");
      default: return Text("Erreur");
    }
  }
}
