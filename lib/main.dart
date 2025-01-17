import 'package:first_app_2025_esilv/controller/global.dart';
import 'package:first_app_2025_esilv/controller/myFiresbaseHelper.dart';
import 'package:first_app_2025_esilv/controller/myanimation.dart';
import 'package:first_app_2025_esilv/controller/permissiongps.dart';
import 'package:first_app_2025_esilv/view/myBackground.dart';
import 'package:first_app_2025_esilv/view/mydashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionGps().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variables
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();

  //fonctions
  popUp() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text("Erreur"),
            content: Text("Erreur sur le mail/mot de passe"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const MyBackground(),
            bodyPage(),
          ],
        ));
  }

  Widget bodyPage() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        MyAnimation(
          delay: 1,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/anime.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MyAnimation(
          delay: 2,
          child: TextField(
            controller: mail,
            decoration: InputDecoration(
                hintText: "Entrer une adresse mail",
                prefixIcon: const Icon(Icons.person),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MyAnimation(
          delay: 3,
          child: TextField(
            obscureText: true,
            controller: pass,
            decoration: InputDecoration(
                hintText: "Entrer votre mot de passe",
                prefixIcon: const Icon(Icons.mail),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MyAnimation(
            delay: 4,
            child: ElevatedButton(
                child: const Text("Inscription"),
                onPressed: () {
                  MyFirebaseHelper()
                      .inscription(email: mail.text, password: pass.text)
                      .then((value) {
                    setState(() {
                      moi = value;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyDasgBoard()));
                  }).catchError((onError) {
                    popUp();
                  });
                })),
        const SizedBox(
          height: 10,
        ),
        MyAnimation(
            delay: 5,
            child: ElevatedButton(
                child: const Text("Connexion"),
                onPressed: () {
                  MyFirebaseHelper()
                      .connexion(email: mail.text, password: pass.text)
                      .then((value) {
                    setState(() {
                      moi = value;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyDasgBoard()));
                  }).catchError((onError) {
                    popUp();
                  });
                })),
      ]),
    );
  }
}
