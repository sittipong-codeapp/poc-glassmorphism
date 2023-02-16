import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20 * 2,
              ),
              child: Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._buildGlassKitWidgets(context),
                const SizedBox(height: 20),
                ..._buildGlassmorphismWidgets(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _buildGlassmorphismWidgets(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return [
      Text(
        'Glassmorphism',
        style: textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 12),
      GlassmorphicContainer(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        blur: 20,
        border: 0.5,
        borderRadius: 18,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000000).withOpacity(0.5),
            const Color(0xFF000000).withOpacity(0.25),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000000).withOpacity(0.1),
            const Color((0xFF000000)).withOpacity(0.05),
          ],
        ),
        child: _buildCounterLabel(context),
      ),
      const SizedBox(height: 12),
      GlassmorphicContainer(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        blur: 20,
        border: 0.5,
        borderRadius: 18,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        child: _buildCounterLabel(context),
      ),
      const SizedBox(height: 12),
      GlassmorphicContainer(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        blur: 20,
        border: 0.5,
        borderRadius: 18,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.0),
          ],
          stops: const [0.1, 0.5],
        ),
        child: _buildCounterLabel(context),
      ),
    ];
  }

  List<Widget> _buildGlassKitWidgets(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return [
      Text(
        'Glass Kit',
        style: textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 12),
      GlassContainer.clearGlass(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        blur: 20,
        borderWidth: 0.5,
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [0.1, 1],
          transform: const GradientRotation(math.pi / 4),
        ),
        borderGradient: SweepGradient(
          colors: [
            const Color(0x00000000),
            Colors.white.withOpacity(0.125),
            Colors.white.withOpacity(0.125),
            const Color(0x00000000),
          ],
          stops: const <double>[0.0, 0.1, 0.5, 0.51],
          transform: const GradientRotation(2.851505721268765),
        ),
        child: _buildCounterLabel(context),
      ),
      const SizedBox(height: 12),
      GlassContainer.clearGlass(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        blur: 20,
        borderWidth: 0.5,
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000000).withOpacity(0.5),
            const Color(0xFF000000).withOpacity(0.25),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000000).withOpacity(0.1),
            const Color((0xFF000000)).withOpacity(0.05),
          ],
        ),
        child: _buildCounterLabel(context),
      ),
    ];
  }

  Widget _buildCounterLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
