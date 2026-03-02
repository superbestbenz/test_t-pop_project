import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/core/function/date_cnverter.dart' show formatDate;
import 'package:t_pop_testing/model/package_history_detail_model/package_h_detail_model.dart'
    show PackageHDetailModel;

class PackageHistoryDetailScreen extends StatefulWidget {
  const PackageHistoryDetailScreen({super.key});

  @override
  State<PackageHistoryDetailScreen> createState() =>
      _PackageHistoryDetailScreenState();
}

class _PackageHistoryDetailScreenState
    extends State<PackageHistoryDetailScreen> {
  PackageHDetailModel? packageDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        packageDetail = Provider.of<PackageHDetailModel?>(
          context,
          listen: false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('package History detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Image.network(
                packageDetail?.packageDetailModel?.imageUrl ??
                    'https://via.placeholder.com/400x200.png?text=No+Image',
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '${packageDetail?.packageDetailModel?.name ?? 'Package Name'} (${packageDetail?.packageDetailModel?.price ?? '0'} THB)',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                packageDetail?.packageDetailModel?.description ??
                    'Package description goes here.',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              packageDetail?.purchasedItem?.endDate?.isAfter(DateTime.now()) ==
                      true
                  ? Text(
                      'Due Date: ${formatDate(packageDetail?.purchasedItem?.endDate)}',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  : Text(
                      'Status: Expired',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
