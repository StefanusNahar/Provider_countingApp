import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counting_provider.dart';

void main() {
  runApp(
    const CountingProvider(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counting App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counting App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Counting>(
                builder: (context, counter, child) {
                  return Text(
                    'Jumlah Counting: ${counter.count}',
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: Provider.of<Counting>(context).pengurangan,
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: Provider.of<Counting>(context).pejumlahan,
                    child: const Text('+'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Counting>(context, listen: false).reset();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
