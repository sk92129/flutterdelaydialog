import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const String htmlSample = 
'''
  <h3>Heading</h3>
  <p>
    A paragraph with <strong>strong</strong>, <em>emphasized</em>
    and <span style="color: red">colored</span> text.
  </p>
  ''';


class _MyHomePageState extends State<MyHomePage> {

 @override
  void initState() {

    super.initState();
    Future.delayed( const Duration(seconds: 2), () {
      showDialog(context: context,
          builder: (BuildContext context) {
            return  AlertDialog(
              title: const Text("hello"),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("world"),
                  SizedBox(height: 10),
                  HtmlWidget(htmlSample),
                ],
              ),
              actions: <Widget> [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(context),
                  child: const Text("OK"),
                ),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("hello"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'foo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
