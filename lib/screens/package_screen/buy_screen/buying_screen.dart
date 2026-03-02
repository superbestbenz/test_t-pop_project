import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_pop_testing/core/enum/payment_enum.dart' show PaymentMethod;
import 'package:t_pop_testing/l10n/app_localizations.dart' show AppLocalizations;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/screens/package_screen/buy_screen/buying_screen_provider.dart'
    show BuyingScreenProvider;

class BuyingScreen extends StatefulWidget {
  const BuyingScreen({super.key});

  @override
  State<BuyingScreen> createState() => _BuyingScreenState();
}

class _BuyingScreenState extends State<BuyingScreen> {
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
    return Consumer<BuyingScreenProvider>(
      builder: (context, provider, child) {
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
                context.read<BuyingScreenProvider>().purchasePackage(
                  context,
                  packageDetail,
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: Text(
                'Pay Now (${packageDetail?.price ?? 'Price not available'} ${AppLocalizations.of(context)!.thb})',
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Image.network(
                    packageDetail?.imageUrl ??
                        'https://via.placeholder.com/400x200.png?text=No+Image',
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    packageDetail?.name ?? 'Package Name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    packageDetail?.description ??
                        'Package description goes here.',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.add),
                      const SizedBox(width: 8),
                      Text('Payment Method'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<PaymentMethod>(
                    initialValue: provider.selectedMethod,
                    items: provider.paymentMethods
                        .map(
                          (m) =>
                              DropdownMenuItem(value: m, child: Text(m.label)),
                        )
                        .toList(),
                    onChanged: (v) {
                      provider.selectMethod(v);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: provider.methodController,

                    decoration: InputDecoration(
                      labelText: 'Method details / custom',
                      hintText: provider.selectedMethod != null
                          ? 'Enter details for ${provider.selectedMethod?.label}'
                          : 'Select a payment method first',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
