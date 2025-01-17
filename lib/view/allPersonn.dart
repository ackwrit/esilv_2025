import 'package:first_app_2025_esilv/controller/myFiresbaseHelper.dart';
import 'package:first_app_2025_esilv/model/myuser.dart';
import 'package:flutter/material.dart';

class AllPerson extends StatefulWidget {
  const AllPerson({super.key});

  @override
  State<AllPerson> createState() => _AllPersonState();
}

class _AllPersonState extends State<AllPerson> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: MyFirebaseHelper().cloudUsers.snapshots(),
        builder: (context,snap){
          if(snap.connectionState == ConnectionState.waiting){
            //temps de chargement
            return Center(
                child: CircularProgressIndicator.adaptive()
            );
          }
          else{
            //fin de chargement
            if(snap.hasData == false){
              //il n'y a pas de donnée
              return Center(
                child: Text("Aucune donnée"),
              );

            }
            else
              {
                //on a des donneés
                List documents = snap.data!.docs;
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context,index){
                      //afficher les personnes
                      MyUser others = MyUser.dbb(documents[index]);
                      return Card(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: ListTile(
                          subtitle: Text(others.email),
                          title: Text(others.id),
                        ),
                      );

                    }
                );

              }

          }
        }
    );
  }
}
