import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/screens/package_screen/package_screen.dart'
    show PackageScreen;
import 'package:t_pop_testing/screens/package_screen/package_screen_provider.dart'
    show PackageScreenProvider;
import 'package:t_pop_testing/data/repository/package_repository.dart';
import 'package:t_pop_testing/data/data_source/package_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-pop Testing',
      home: ChangeNotifierProvider(
        // provide the required PackageRepository dependency
        create: (_) => PackageScreenProvider(PackageRepository(PackageApi())),
        child: const PackageScreen(),
      ),
    );
  }
}
