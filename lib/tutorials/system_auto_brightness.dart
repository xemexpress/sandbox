import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final WidgetsBinding _widgetsBinding;
  late ThemeModeNotifier _themeModeNotifier;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);

    _themeModeNotifier = ThemeModeNotifier(
      appBrightness: ValueNotifier<Brightness>(
        _widgetsBinding.platformDispatcher.platformBrightness,
      ),
    );

    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModeNotifier.changeBrightness(
      brightness: _widgetsBinding.platformDispatcher.platformBrightness,
    );

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeModeNotifier.appBrightness,
      builder: (context, brightness, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: brightness,
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Auto Brightness'),
      ),
    );
  }
}

class ThemeModeNotifier {
  final ValueNotifier<Brightness> appBrightness;

  ThemeModeNotifier({required this.appBrightness});

  changeBrightness({required Brightness brightness}) {
    appBrightness.value = brightness;
  }
}
