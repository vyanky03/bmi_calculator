import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIApp(),
    );
  }
}

class BMIApp extends StatefulWidget {
  const BMIApp({super.key});

  @override
  State<BMIApp> createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bgColor = Colors.indigo.shade200;

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI App'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Calculate your BMI',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.line_weight),
                        label: Text('Enter your weight in KGs'))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.height),
                        label: Text('Enter your height in feet'))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: inchController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.height),
                        label: Text('Enter your height in inches'))),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (wt != '' && ft != '' && inch != '') {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt) * 12 + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);
                        var msg = '';

                        if (bmi > 25) {
                          bgColor = Colors.red.shade200;
                          msg = 'You are overweight!';
                        } else if (bmi < 18) {
                          msg = 'You are underweight!';
                          bgColor = Colors.yellow.shade200;
                        } else {
                          msg = 'You are healthy!';
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please fill all the required lines';
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
