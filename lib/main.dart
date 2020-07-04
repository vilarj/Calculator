import 'package:Calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solve',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Solve'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var equation = '', answer = '';

  final List<String> barBtn = [
    'C',
    '¬',
    '﹪',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '∫α',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    title:
    Text(widget.title);
    // ignore: non_constant_identifier_names
    bool Operator(String x) {
      if (x == '﹪' ||
          x == '÷' ||
          x == '×' ||
          x == '-' ||
          x == '+' ||
          x == 'C' ||
          x == '¬' ||
          x == '=') {
        return true;
      } else {
        return false;
      }
    }

    void equalBtn() {
      String result = equation;
      result = result.replaceAll('×', '*');
      result = result.replaceAll('÷', '/');
      result = result.replaceAll('﹪', '%');

      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      answer = eval.toString();
    }

    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      equation,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      answer,
                      style: TextStyle(fontSize: 28),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: barBtn.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Btn(
                        btnTapped: () {
                          setState(() {
                            if (index == 0) {
                              equation = answer = '';
                            } else if (index == 1) {
                              equation =
                                  equation.substring(0, equation.length - 1);
                            }
                            // equal sign
                            else if (index == barBtn.length - 1) {
                              equalBtn();
                            }
                            else if (index == 18) {
                              // TODO: Display new bar buttons containing calculus operators
                            } else {
                              equation += barBtn[index];
                            }
                          });
                        },
                        btnText: barBtn[index],
                        color: Operator(barBtn[index])
                            ? Colors.redAccent
                            : Colors.blue[200],
                        txtColor: Operator(barBtn[index])
                            ? Colors.white
                            : Colors.black);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
