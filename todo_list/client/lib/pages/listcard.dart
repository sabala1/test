import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/models/informationModel.dart';
import 'package:todo_list/widgets/titleWidget.dart';

import '../constants/style.dart';
import '../constants/uri.dart';
import '../widgets/showProgressLinear.dart';

class ListCard extends StatefulWidget {
  const ListCard({super.key});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool load = true;
  List<InformationModel> informationModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readApi();
  }

  Future<Null> readApi() async {
    String urlAPI = '${uri}/api/information';
    await Dio().get(urlAPI).then(
      (value) {
        setState(() {
          load = false;
        });
        print(uri);
        print('value ==> ${value}');
        var urlAPI = json.decode(value.data);
        for (var item in urlAPI) {
          //print('item ==>> $item');
          InformationModel model = InformationModel.fromMap(item);
          print('name ==>> ${model.namelast}');

          setState(() {
            informationModel.add(model);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: informationModel.length,
          itemBuilder: ((context, index) => Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowTitle(
                      title: informationModel[index].namelast,
                      textStyle: tb2Style(),
                    ),
                    ShowTitle(
                      title: informationModel[index].phone,
                      textStyle: tb2Style(),
                    ),
                    ShowTitle(
                      title: informationModel[index].address,
                      textStyle: tb2Style(),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
