import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebaseHelper {
  //attributs
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

  //méthode

  //inscription
  inscription({required String email, required String password}) {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //connexion

  //creation d'un utilisateur

  //mise à jour des infos de l'utilisateur

  //supprimer un utilisateur
}
