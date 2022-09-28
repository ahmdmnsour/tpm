import 'package:flutter/material.dart';
import 'package:testo/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/background-home.jpeg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: SizedBox(
              height: 25,
              child: Image.asset(
                'assets/Elaraby-group-logo.png',
                fit: BoxFit.cover,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/tpm-cplumns.png',
              width: 600,
            ),
            Text(
              'مرحبا بك في تطبيق عرض بيانات TPM',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.blue[900],
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black26,
                  primary: Colors.lightBlueAccent[400],
                  side:
                      const BorderSide(width: 3, color: Colors.lightBlueAccent),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("للدخول إضغط هنا"),
            )
          ],
        )),
      )
    ]);
  }
}
