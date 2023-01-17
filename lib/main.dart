import 'package:flutter/material.dart';
import 'BMICalculatorInput.dart';
import 'BMICalculatorResult.dart  ';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const BMIHome());
}

class BMIHome extends StatelessWidget {
  const BMIHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BMICalculator(),
        '/BMIResult': (context) => const BMICalculatorResult()
      },
    );
  }
}