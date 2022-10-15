import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:testo/second.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  _TestPageState();

  String? deptValue;
  String? machineValue;
  List machs = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('اختر الماكينة'),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/mach.json'),
                      builder: ((context, snapshot) {
                        Map newData = {};
                        if (snapshot.hasData) {
                          newData = json.decode(snapshot.data.toString());
                        }
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  constraints: const BoxConstraints(
                                      maxWidth: 130,
                                      minWidth: double.minPositive),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    isExpanded: true,
                                    hint: const Text('القسم'),
                                    value: deptValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        machineValue = null;
                                        deptValue = newValue.toString();
                                        machs = newData[deptValue];
                                      });
                                    },
                                    items: newData.keys
                                        .toList()
                                        .map((e) => DropdownMenuItem(
                                            value: e, child: Text(e)))
                                        .toList(),
                                  )),
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                constraints: const BoxConstraints(
                                    maxWidth: 130,
                                    minWidth: double.minPositive),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  hint: const Text('الماكينة'),
                                  value: machineValue,
                                  onChanged: (newValue) {
                                    setState(() =>
                                        machineValue = newValue.toString());
                                  },
                                  items: machs
                                      .map((e) => DropdownMenuItem(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ]);
                      })),
                ),
              ),
              body: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    return Center(
                      child: SelectCard(
                          choice: choices[index], machine: machineValue),
                    );
                  })));
        }));
  }
}

class Choice {
  const Choice(
      {required this.title,
      required this.icon,
      required this.jsonData,
      required this.titleKey});
  final String title;
  final IconData icon;
  final String jsonData;
  final String titleKey;
}

List<Choice> choices = const <Choice>[
  // Choice(title: 'التاجات', icon: Icons.sell),
  // Choice(title: 'اماكن صعبة الوصول', icon: Icons.block),
  // Choice(title: 'المخاطر', icon: Icons.warning),
  Choice(
      title: 'هيكل الماكينة',
      icon: Icons.precision_manufacturing,
      jsonData: 'assets/machParts.json',
      titleKey: 'اسم الجزء'),
  // Choice(title: 'نظرية عمل الماكينة', icon: Icons.psychology),
  // Choice(title: 'OPL', icon: Icons.settings),
  // Choice(title: 'نموذج لنعرف لماذا', icon: Icons.settings),
  // Choice(title: 'تحسينات', icon: Icons.settings),
  // Choice(title: 'حلقات ال tpm', icon: Icons.settings),
  // Choice(title: 'اعطال الماكينة', icon: Icons.settings),
  // Choice(title: 'مصادر التدريب', icon: Icons.settings),
  // Choice(title: 'خرائط التشحيم و التربيط والتنظيف', icon: Icons.settings),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice, required this.machine})
      : super(key: key);
  final Choice choice;
  final String? machine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (machine != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                      choice.title, machine!, choice.jsonData, choice.titleKey),
                ));
          } else {
            const snackBar = SnackBar(
              content: Text('من فضلك اختر القسم و الماكينة اولا'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Card(
            color: Colors.white,
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(choice.icon, size: 40),
                    Text(choice.title),
                  ]),
            ))));
  }
}
