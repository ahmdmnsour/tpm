import 'package:flutter/material.dart';
import 'package:testo/Models/hard_to_reach.dart';
import 'package:testo/second.dart';
import './second.dart';

import 'Models/dept.dart';
import 'Models/hard_to_reach.dart';
import 'Models/machine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  List<Dept>? depts;
  @override
  void initState() {
    super.initState();
    HtoReach place = HtoReach('سيور الحدافة', 'صعوبة الفحص',
        'استخدام سلم لسهولة الوصول للسيور', 'الانتاج');
    Machine mach = Machine('مكبس 45', [place]);
    Dept dept = Dept('مكابس السخان', [mach]);
    depts = [dept];
  }

  Dept? deptValue;
  Machine? machineValue;

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
                          child: DropdownButton<Dept>(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: const Text('القسم'),
                            value: deptValue,
                            onChanged: (Dept? newValue) {
                              setState(() => deptValue = newValue!);
                            },
                            items: depts
                                ?.map<DropdownMenuItem<Dept>>((Dept? value) {
                              return DropdownMenuItem<Dept>(
                                value: value,
                                child: Text(value?.deptName),
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
                          child: DropdownButton<Machine>(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: const Text('الماكينة'),
                            value: machineValue,
                            onChanged: (Machine? newValue) {
                              setState(() => machineValue = newValue!);
                            },
                            items: deptValue?.machines.map<DropdownMenuItem<Machine>>((Machine value) {
                              return DropdownMenuItem<Machine>(
                                value: value,
                                child: Text(value.machineName),
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
                      child: SelectCard(choice: choices[index], machine: machineValue,),
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
  Choice(title: 'نموذج لنعرف لماذا', icon: Icons.settings),
  Choice(title: 'تحسينات', icon: Icons.settings),
  Choice(title: 'حلقات ال tpm', icon: Icons.settings),
  Choice(title: 'اعطال الماكينة', icon: Icons.settings),
  Choice(title: 'مصادر التدريب', icon: Icons.settings),
  Choice(title: 'خرائط التشحيم و التربيط والتنظيف', icon: Icons.settings),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice, required this.machine}) : super(key: key);
  final Choice choice;
  final Machine? machine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(choice.title, machine!)),
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
