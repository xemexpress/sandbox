import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Row(
            children: [
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                text: 'primary',
              ),
              ColorCard(
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                text: 'onPrimary',
              ),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            children: [
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                text: 'primaryContainer',
              ),
              ColorCard(
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                text: 'onPrimaryContainer',
              ),
            ],
          ),
          Row(
            children: [
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                text: 'secondary',
              ),
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.secondary,
                text: 'onSecondary',
              ),
            ],
          ),
          Row(
            children: [
              ColorCard(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                text: 'secondaryContainer',
              ),
              ColorCard(
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                text: 'onSecondaryContainer',
              ),
            ],
          ),
          Row(
            children: [
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Theme.of(context).colorScheme.onTertiary,
                text: 'tertiary',
              ),
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.onTertiary,
                foregroundColor: Theme.of(context).colorScheme.tertiary,
                text: 'onTertiary',
              ),
            ],
          ),
          Row(
            children: [
              ColorCard(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onTertiaryContainer,
                text: 'tertiaryContainer',
              ),
              ColorCard(
                backgroundColor:
                    Theme.of(context).colorScheme.onTertiaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                text: 'onTertiaryContainer',
              ),
            ],
          ),
          Row(
            children: [
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
                text: 'error',
              ),
              ColorCard(
                backgroundColor: Theme.of(context).colorScheme.onError,
                foregroundColor: Theme.of(context).colorScheme.error,
                text: 'onError',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 45, 10, 0),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: foregroundColor,
                ),
          ),
        ),
      ),
    );
  }
}
