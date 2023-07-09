import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counting with ChangeNotifier {
  int _counting = 0;

  int get count => _counting;

  void pejumlahan() {
    _counting++;
    notifyListeners();
  }

  void pengurangan() {
    _counting--;
    notifyListeners();
  }

  void reset() {
    _counting = 0;
    notifyListeners();
  }
}

class CountingProvider extends StatelessWidget {
  final Widget child;

  const CountingProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counting>(
      create: (_) => Counting(),
      child: child,
    );
  }
}
