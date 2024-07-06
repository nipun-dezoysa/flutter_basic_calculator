import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcButton(String txt, Color btnColor, Color txtColor) {
    return Container(
        child: ElevatedButton(
      onPressed: () {
        addToScreen(txt);
      },
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: btnColor,
          padding: EdgeInsets.all(20)),
      child: Text(txt, style: TextStyle(fontSize: 35, color: txtColor)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Calculator'),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '$numOne$opr$numTwo',
                      textAlign: TextAlign.left,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 100),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('c', Colors.grey, Colors.black),
                  calcButton('d', Colors.grey, Colors.black),
                  calcButton('%', Colors.grey, Colors.black),
                  calcButton('/', Colors.amber, Colors.black),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('7', Colors.grey, Colors.black),
                  calcButton('8', Colors.grey, Colors.black),
                  calcButton('9', Colors.grey, Colors.black),
                  calcButton('x', Colors.amber, Colors.black),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('4', Colors.grey, Colors.black),
                  calcButton('5', Colors.grey, Colors.black),
                  calcButton('6', Colors.grey, Colors.black),
                  calcButton('-', Colors.amber, Colors.black),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('1', Colors.grey, Colors.black),
                  calcButton('2', Colors.grey, Colors.black),
                  calcButton('3', Colors.grey, Colors.black),
                  calcButton('+', Colors.amber, Colors.black),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('0', Colors.grey, Colors.black),
                  calcButton('.', Colors.grey, Colors.black),
                  calcButton('=', Colors.amber, Colors.black),
                ],
              )
            ],
          ),
        ));
  }

  dynamic numOne = '0';
  dynamic numTwo = '';

  dynamic opr = '';
  dynamic preOpr = '';

  void addToScreen(String txt) {
    if (txt == 'c') {
      numOne = '0';
      numTwo = '';
      opr = '';
      preOpr = '';
    } else if (txt == 'd') {
      if (numOne.length == 1) {
        numOne = '0';
      } else if (opr == "") {
        numOne = numOne.substring(0, numOne.length - 1);
      } else if (numTwo == '') {
        opr = '';
      } else {
        numTwo = numTwo.substring(0, numTwo.length - 1);
      }
    } else if (txt == '+' || txt == '-' || txt == 'x' || txt == '/') {
      if (opr == '') {
        opr = txt;
      } else if (numTwo != '' && numOne != '') {
        cal();
        opr = txt;
        numTwo = '';
      }
    } else if (txt == "=") {
      if (opr != "" && numTwo != "") {
        cal();
        opr = "";
        numTwo = "";
      }
    }else if(txt=="%"){
      if (opr != "" && numTwo != "") {
        cal();
        opr = "";
        numTwo = "";
      }
      numOne=formatNum(double.parse(numOne)/100);
    } else {
      if (opr == "") {
        if (numOne == "0") {
          numOne = txt;
        } else {
          numOne = numOne + txt;
        }
      } else {
        numTwo = numTwo + txt;
      }
    }
    setState(() {});
  }

  void cal() {
    if (opr == '+') {
      numOne = formatNum((double.parse(numOne) + double.parse(numTwo)));
    } else if (opr == '-') {
      numOne = formatNum((double.parse(numOne) - double.parse(numTwo)));
    } else if (opr == 'x') {
      numOne = formatNum((double.parse(numOne) * double.parse(numTwo)));
    } else if (opr == '/') {
      numOne = formatNum((double.parse(numOne) / double.parse(numTwo)));
    }
  }

  dynamic formatNum(double a) {
    var temp = a.toStringAsFixed(2);
    if (temp.contains('.')) {
      var len = temp.length;
      while (temp[len - 1] == '0') {
        len--;
      }
      if (temp[len - 1] == '.') {
        len--;
      }
      temp = temp.substring(0, len);
    }
    return temp;
  }
}
