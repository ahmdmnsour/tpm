import 'dart:convert';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage(this.title, this.machine, this.jsonData, this.titleKey, {Key? key})
      : super(key: key);
  String title;
  String machine;
  String jsonData;
  String titleKey;

  @override
  SecondPageState createState() =>
      SecondPageState(title, machine, jsonData, titleKey);
}

class SecondPageState extends State<SecondPage> {
  SecondPageState(this.title, this.machine, this.jsonData, this.titleKey);
  String title;
  String machine;
  String jsonData;
  String titleKey;

  List<String> itemsTitle = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString(jsonData),
              builder: (((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('لا يوجد معلومات');
                } else {
                  var newData = json.decode(snapshot.data.toString());
                  for (int i = 0; i < newData.length; i++) {
                    if (newData[i]['الماكينة'] == machine) {
                      itemsTitle.add(newData[i][titleKey]);
                    }
                  }

                  return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ExpansionTile(
                          title: Text(itemsTitle[index]),
                          children: [
                            ListView.builder(
                                itemCount: newData[index].length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, pos) {
                                  return Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.loose,
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          child: Text(newData[index]
                                              .keys
                                              .elementAt(pos)),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          child: Text(newData[index]
                                              .values
                                              .elementAt(pos)),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                          ],
                        ));
                      });
                }
              })),
            )));
  }
}
