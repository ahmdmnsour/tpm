import 'package:flutter/material.dart';
import 'package:testo/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(50),
                constraints: const BoxConstraints(maxWidth: 500, minWidth: 250),
                child: Column(
                  children: <Widget>[
                    const TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'البريد',
                      ),
                    ),
                    const TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'الرمز',
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 30),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: const Text('سجل'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        })
      );
  }
}
