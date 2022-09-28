import 'package:flutter/material.dart';

import 'Models/hard_to_reach.dart';
import 'Models/machine.dart';

class SecondPage extends StatefulWidget {
  SecondPage(this.title, this.mach, {Key? key}) : super(key: key);
  String title;
  Machine mach;

  @override
  SecondPageState createState() => SecondPageState(title, mach);
}

class SecondPageState extends State<SecondPage> {
  SecondPageState(this.title, this.mach);
  String title;
  Machine mach;
  List<String> attr = ['نوع المشكلة', 'طريقة الازالة', 'الجهات المسئولة'];
  List<String>? val;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView.builder(
                itemCount: mach.hardToReach.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ExpansionTile(
                    title: Text(mach.hardToReach[index].placeName),
                    children: [
                      ListView.builder(
                          itemCount: attr.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, pos) {
                            val = [
                              mach.hardToReach[index].blockType,
                              mach.hardToReach[index].removalMethod,
                              mach.hardToReach[index].partiesConcerned
                            ];
                            return Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(attr[pos]),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(val![pos]),
                                  ),
                                ),
                              ],
                            );
                          })
                    ],
                  ));
                })));
  }
}
