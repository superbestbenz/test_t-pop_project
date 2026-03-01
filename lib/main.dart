import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/screens/package_screen/package_screen.dart' show PackageScreen;
import 'package:t_pop_testing/screens/package_screen/package_screen_provider.dart' show PackageScreenProvider;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-pop Testing',
      home:  ChangeNotifierProvider(
        create: (_) => PackageScreenProvider(),
        child: const PackageScreen(),
      ),
    );
  }
}
