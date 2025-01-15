import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_2025_esilv/model/myuser.dart';
import 'package:flutter/material.dart';

class MyFirebaseHelper {
  //attributs
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

  //méthode

  //inscription
  Future<MyUser> inscription(
      {required String email, required String password}) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = credential.user!.uid;
    Map<String, dynamic> map = {
      "EMAIL": email,
      "NOM": '',
      "PRENOM": '',
      "INSCRIPTIONDATE": DateTime.now(),
    };
    createUser(uid, map);
    return getUser(uid);
  }

  //connexion
  Future<MyUser> connexion(
      {required String email, required String password}) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    return getUser(uid);
  }

  //récuperer l'utilisateur
  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot snap = await cloudUsers.doc(uid).get();
    return MyUser.dbb(snap);
  }

  //creation d'un utilisateur
  createUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).set(data);
  }

  //mise à jour des infos de l'utilisateur
  updateUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).update(data);
  }

  //supprimer un utilisateur
}
