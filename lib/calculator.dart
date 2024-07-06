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
      onPressed: () {},
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
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "0",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 100),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('ac', Colors.grey, Colors.black),
                  calcButton('+/-', Colors.grey, Colors.black),
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.fromLTRB(34, 10, 128, 10)),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                  ),
                  calcButton('.', Colors.grey, Colors.black),
                  calcButton('=', Colors.amber, Colors.black),
                ],
              )
            ],
          ),
        ));

        
  }
}
