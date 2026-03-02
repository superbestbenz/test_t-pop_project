import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ReadContext, Selector;
import 'package:t_pop_testing/core/function/date_cnverter.dart' show formatDate;
import 'package:t_pop_testing/core/widget/w_skeleton_loading.dart'
    show WSkeletonLoading, SkeletonState;
import 'package:t_pop_testing/l10n/app_localizations.dart';
import 'package:t_pop_testing/model/package_history_detail_model/package_h_detail_model.dart' show PackageHDetailModel;
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart'
    show PurchasedItem;
import 'package:t_pop_testing/screens/package_history/package_history_screen_provider.dart'
    show PackageHistoryScreenProvider;

class PackgeHistoryScreen extends StatefulWidget {
  const PackgeHistoryScreen({super.key});

  @override
  State<PackgeHistoryScreen> createState() => _PackgeHistoryScreenState();
}

class _PackgeHistoryScreenState extends State<PackgeHistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PackageHistoryScreenProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Purchase History')),
      body: Selector<PackageHistoryScreenProvider, SkeletonState>(
        selector: (p0, p1) => p1.isLoading,
        builder: (context, isLoading, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: WSkeletonLoading(
              loadingState: isLoading,
              loadingWidget: _LoadingWidget(),
              successWidget:
                  Selector<PackageHistoryScreenProvider, List<PurchasedItem>?>(
                    selector: (p0, p1) => p1.purchaseHistory,
                    builder: (context, purchaseHistory, child) {
                      return ListView.separated(
                        itemCount: purchaseHistory?.length ?? 0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final historyItem = purchaseHistory?[index];
                          final packageDetail = context
                              .read<PackageHistoryScreenProvider>()
                              .selectPackageDetail(historyItem?.itemId ?? '');
                          return HistoryBody(
                            packageDetail:PackageHDetailModel(packageDetailModel: packageDetail,purchasedItem: historyItem),
                          );
                        },
                      );
                    },
                  ),
            ),
          );
        },
      ),
    );
  }
}

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key, this.packageDetail, });
  final PackageHDetailModel? packageDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
              context,
              '/package-history-detail',
              arguments: packageDetail,
            );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
                child: Image.network(
                  packageDetail?.packageDetailModel?.imageUrl ??
                      'https://via.placeholder.com/400x200.png?text=No+Image',
      
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      packageDetail?.packageDetailModel?.name ?? 'Package Name',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      packageDetail?.packageDetailModel?.description ??
                          'Package description goes here.',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: .end,
                      children: [Text('${packageDetail?.packageDetailModel?.price ?? 0} ${AppLocalizations.of(context)!.thb}')],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                       packageDetail?.purchasedItem?.endDate?.isAfter(DateTime.now()) == true
                            ? Text(
                                'Due Date: ${formatDate(packageDetail?.purchasedItem?.endDate)}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                'Status: Expired',
                                style: TextStyle(color: Colors.red, fontSize: 16),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

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
