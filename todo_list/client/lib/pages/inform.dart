import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/style.dart';

import '../constants/networkhandler.dart';
import '../constants/uri.dart';
import '../models/informationModel.dart';
import '../widgets/titleWidget.dart';
import 'package:http/http.dart' as http;

class Inform extends StatefulWidget {
  const Inform({super.key});

  @override
  State<Inform> createState() => _InformState();
}

class _InformState extends State<Inform> {
  var formKey = GlobalKey<FormState>();
  final Networkhandler networkhandler = Networkhandler();

  TextEditingController namelastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void save() {
    networkhandler.information(
      context: context,
      namelast: namelastController.text,
      phone: phoneController.text,
      address: addressController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildTitleMain("ข้อมูลส่วนตัว"),
                formNameLast(),
                formPhone(),
                formAddress(),
                buildElevatedButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildElevatedButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: size * 0.9,
          height: 45,
          child: ElevatedButton(
            style: bgPinkStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                save();
              } else {
                print('not ok');
              }
            },
            child: const Text(
              'บันทึก',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget formAddress() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        controller: addressController,
        maxLines: 3,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'ที่อยู่ปัจจุบัน',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cBlack),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget formPhone() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'เบอร์โทรศัพท์',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cBlack),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget formNameLast() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        controller: namelastController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: 'ชื่อ - สกุล',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cBlack),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cRed),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget buildTitleMain(String title) => Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ShowTitle(
            title: title,
            textStyle: tb1Style(),
          ),
        ),
      );
}
