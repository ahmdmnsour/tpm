import 'package:flutter/material.dart';
import 'package:testo/second.dart';
import './second.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? deptValue;
  String? machineValue;

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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          constraints: const BoxConstraints(
                              maxWidth: 130, minWidth: double.minPositive),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: const Text('القسم'),
                            value: deptValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                deptValue = newValue!;
                              });
                            },
                            items: <String>['قسم 1', 'قسم 2', 'قسم 3', 'قسم 4']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          constraints: const BoxConstraints(
                              maxWidth: 130, minWidth: double.minPositive),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: const Text('الماكينة'),
                            value: machineValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                machineValue = newValue!;
                              });
                            },
                            items: <String>[
                              'ماكينة 1',
                              'ماكينة 2',
                              'ماكينة 3',
                              'ماكينة 4'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                ),
              ),
              body: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    return Center(
                      child: SelectCard(choice: choices[index]),
                    );
                  })));
        }));
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  Choice(title: 'التاجات', icon: Icons.sell),
  Choice(title: 'اماكن صعبة الوصول', icon: Icons.block),
  Choice(title: 'المخاطر', icon: Icons.warning),
  Choice(title: 'هيكل الماكينة', icon: Icons.precision_manufacturing),
  Choice(title: 'نظرية عمل الماكينة', icon: Icons.psychology),
  Choice(title: 'OPL', icon: Icons.settings),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(title: choice.title)),
          );
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
