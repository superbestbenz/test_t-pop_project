import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/core/state/app_state.dart' show AppState;
import 'package:t_pop_testing/screens/package_screen/package_screen.dart'
    show PackageScreen;
import 'package:t_pop_testing/screens/package_screen/package_screen_provider.dart'
    show PackageScreenProvider;
import 'package:t_pop_testing/core/routes/app_routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:t_pop_testing/data/repository/package_repository.dart';
import 'package:t_pop_testing/data/data_source/package_api.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-pop Testing',
      builder: EasyLoading.init(),
      home: ChangeNotifierProvider(
        create: (_) => PackageScreenProvider(
          PackageRepository(PackageApi(appState: context.read<AppState>())),
        ),
        child: const PackageScreen(),
      ),
      routes: AppRoutes.getRoutes(),
    );
  }
}
