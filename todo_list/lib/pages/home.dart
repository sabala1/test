import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late int first, second;
  late String opp;
  late String result, text = '';

  void btnClicked(String btnText) {
    if(btnText == 'C'){
      result = '';
      text = '';
      first = 0;
      second = 0;
    }else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/'){
      first = int.parse(text);
      result = '';
      opp = btnText;
    }else if (btnText == '=') {
      second = int.parse(text);
      if(opp == '+') {
        result = (first + second).toString();
      }else if (opp == '-') {
        result = (first - second).toString();
      }else if (opp == 'x') {
        result = (first * second).toString();
      }else if (opp == '/') {
        result = (first / second).toString();
      }
    }else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: cRed,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _buildOutlinedButton('9'),
                _buildOutlinedButton('8'),
                _buildOutlinedButton('7'),
                _buildOutlinedButton('+'),
              ],
            ),
            Row(
              children: [
                _buildOutlinedButton('6'),
                _buildOutlinedButton('5'),
                _buildOutlinedButton('4'),
                _buildOutlinedButton('-'),
              ],
            ),
            Row(
              children: [
                _buildOutlinedButton('3'),
                _buildOutlinedButton('2'),
                _buildOutlinedButton('1'),
                _buildOutlinedButton('x'),
              ],
            ),
            Row(
              children: [
                _buildOutlinedButton('C'),
                _buildOutlinedButton('0'),
                _buildOutlinedButton('='),
                _buildOutlinedButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildOutlinedButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 25,
              color: cBlack,
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: cBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Calculator',
            style: TextStyle(
              color: cWhite,
            ),
          ),
        ],
      ),
    );
  }
}
