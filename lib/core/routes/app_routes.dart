import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/core/state/app_state.dart';
import 'package:t_pop_testing/data/data_source/package_api.dart'
    show PackageApi;
import 'package:t_pop_testing/data/repository/package_repository.dart'
    show PackageRepository;
import 'package:t_pop_testing/model/package_history_detail_model/package_h_detail_model.dart' show PackageHDetailModel;
import 'package:t_pop_testing/screens/package_history/package_history_detail/package_history_detail.dart'
    show PackageHistoryDetailScreen;
import 'package:t_pop_testing/screens/package_history/package_history_screen_provider.dart'
    show PackageHistoryScreenProvider;
import 'package:t_pop_testing/screens/package_history/packge_history_screen.dart'
    show PackgeHistoryScreen;
import 'package:t_pop_testing/screens/package_screen/buy_screen/buying_screen.dart'
    show BuyingScreen;
import 'package:t_pop_testing/screens/package_screen/buy_screen/buying_screen_provider.dart'
    show BuyingScreenProvider;
import 'package:t_pop_testing/screens/package_screen/package_detail_screen/package_detail_screen.dart'
    show PackageDetailScreen;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;

class AppRoutes {
  static const String packageDetail = '/package-detail';
  static const String buying = '/buying';
  static const String packageHistory = '/package-history';
  static const String packageHistoryDetail = '/package-history-detail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      packageDetail: _buildPackageDetailRoute,
      buying: _buildBuyingRoute,
      packageHistory: _buildPackageHistoryRoute,
      packageHistoryDetail: _buildPackageHistoryDetailRoute,
    };
  }

  static Widget _buildPackageDetailRoute(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PackageDetailModel?;

    return Provider<PackageDetailModel?>.value(
      value: args,
      child: const PackageDetailScreen(),
    );
  }

  static Widget _buildBuyingRoute(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PackageDetailModel?;
    return Provider<PackageDetailModel?>.value(
      value: args,
      child: ChangeNotifierProvider(
        create: (_) => BuyingScreenProvider(
          PackageRepository(PackageApi(appState: context.read<AppState>())),
        ),
        child: const BuyingScreen(),
      ),
    );
  }

  static Widget _buildPackageHistoryRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackageHistoryScreenProvider(
        PackageRepository(PackageApi(appState: context.read<AppState>())),
      ),
      child: const PackgeHistoryScreen(),
    );
  }

  static Widget _buildPackageHistoryDetailRoute(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PackageHDetailModel?;
    return Provider<PackageHDetailModel?>.value(
      value: args,
      child: const PackageHistoryDetailScreen(),
    );
  }
}
