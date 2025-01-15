import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyUser {
  //attributs
  late String id;
  late String nom;
  late String prenom;
  late DateTime dateInscription;
  DateTime? birthday;
  late String email;
  String? avatar;
  String? pseudo;
  List? mesFavoris;

  //méhode
  // les constructeurs

  MyUser() {
    id = '';
    nom = '';
    prenom = '';
    dateInscription = DateTime.now();
    email = '';
  }

  MyUser.dbb(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> dict = snapshot.data() as Map<String, dynamic>;
    nom = dict["NOM"];
    prenom = dict["PRENOM"];
    Timestamp dateIns = dict["INSCRIPTIONDATE"];
    dateInscription = dateIns.toDate();
    Timestamp? birthProvisoire = dict["BIRTHDAY"];
    if (birthProvisoire != null) {
      birthday = birthProvisoire.toDate();
    }
    email = dict["EMAIL"];

    avatar = dict["AVATAR"] ?? "liensParDefaut";
    pseudo = dict["PSEUDO"] ?? "";
    mesFavoris = dict["FAVORIS"] ?? [];
  }
}
