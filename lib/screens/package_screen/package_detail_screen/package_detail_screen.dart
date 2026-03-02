import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/l10n/app_localizations.dart' show AppLocalizations;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/screens/package_screen/package_screen_provider.dart'
    show PackageScreenProvider;

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({super.key});

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  PackageDetailModel? packageDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        packageDetail = Provider.of<PackageDetailModel?>(
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
        title: Text('package detail'),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton.icon(
          onPressed: () {
            Provider.of<PackageScreenProvider>(
              context,
              listen: false,
            ).confirmpackage(context, packageDetail);
          },
          icon: const Icon(Icons.shopping_cart),
          label: Text(
            'Buy Now (${AppLocalizations.of(context)!.payNow.replaceAll('#1', packageDetail?.price.toString() ?? '0')} ${AppLocalizations.of(context)!.thb})',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Image.network(
                packageDetail?.imageUrl ??
                    'https://via.placeholder.com/400x200.png?text=No+Image',
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  packageDetail?.name ?? 'Package Name',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                packageDetail?.description ?? 'Package description goes here.',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
