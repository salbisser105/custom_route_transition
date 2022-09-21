import 'package:flutter/material.dart';
import 'package:custom_route_transition_sa/custom_route_transition_sa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'page1',
      routes: {
        'page1': ((context) => const Page1()),
        'page2': ((context) => const Page2())
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              CustomRouteTransitionSa(child: const Page2(), context: context);
            },
            child: const Text('go to page2')),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Page2'),
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: Text('page2'),
      ),
    );
  }
}
