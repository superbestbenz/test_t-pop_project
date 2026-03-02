import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/core/widget/w_skeleton_loading.dart'
    show WSkeletonLoading, SkeletonState;
import 'package:t_pop_testing/l10n/app_localizations.dart' show AppLocalizations;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/screens/package_screen/package_screen_provider.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PackageScreenProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.shoppingPackage),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/package-history');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Selector<PackageScreenProvider, SkeletonState>(
          selector: (p0, p1) => p1.isLoading,
          builder: (context, isLoading, child) {
            return WSkeletonLoading(
              loadingState: isLoading,
              loadingWidget: const _PackageSkeletonLoading(),
              successWidget: ListView.separated(
                itemCount:
                    context
                        .read<PackageScreenProvider>()
                        .packageDetail
                        ?.length ??
                    0,
                itemBuilder: (context, index) => CardPackage(index: index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardPackage extends StatelessWidget {
  const CardPackage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Selector<PackageScreenProvider, List<PackageDetailModel>?>(
      selector: (p0, p1) => p1.packageDetail,
      builder: (context, listPackage, child) {
        PackageDetailModel? packageDetail = listPackage?[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/package-detail',
              arguments: packageDetail,
            );
          },
          child: Container(
            height: 310,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Image.network(
                  packageDetail?.imageUrl ??
                      'https://via.placeholder.com/400x200.png?text=No+Image',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  packageDetail?.name ?? 'Package Name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    packageDetail?.description ??
                        'Package description goes here.',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        packageDetail != null
                            ? '฿${packageDetail.price}'
                            : 'Price',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<PackageScreenProvider>().confirmpackage(
                            context,
                            packageDetail,
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: Text(AppLocalizations.of(context)!.buy),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PackageSkeletonLoading extends StatelessWidget {
  const _PackageSkeletonLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
