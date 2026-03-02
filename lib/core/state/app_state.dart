import 'package:flutter/material.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart'
    show PurchasedItem;

class AppState extends ChangeNotifier {
  final List<PurchasedItem> _purchasedItems = List.empty(growable: true);
  List<PurchasedItem> get purchasedItems => _purchasedItems;
  void addItem(PurchasedItem item) {
    _purchasedItems.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _purchasedItems.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  List<PackageDetailModel> packageDetails = [
    PackageDetailModel(
      id: 'pack1',
      name: 'daily package',
      description:
          'Perfect for daily users who want to stay updated. Get unlimited access to all premium features every single day for just 100 baht. This package is ideal if you want to try our service without long-term commitment. Enjoy streaming, downloads, and exclusive content daily.',
      price: 100,
      imageUrl:
          'https://st2.depositphotos.com/4428871/6740/i/450/depositphotos_67404901-stock-photo-daily.jpg',
      duration: Duration(days: 1),
    ),
    PackageDetailModel(
      id: 'pack2',
      name: 'weekly package',
      description:
          'Enjoy seven full days of premium access with our weekly package at just 690 baht. Perfect for users who want more flexibility and are ready for a slightly longer commitment. Includes all premium features, priority support, and ad-free streaming throughout the entire week.',
      price: 690,
      imageUrl:
          'https://marketplace.canva.com/EAGGin98LIc/2/0/1600w/canva-orange-and-white-floral-weekly-calendar-G77HiFQzkQ0.jpg',
      duration: Duration(days: 7),
    ),
    PackageDetailModel(
      id: 'pack3',
      name: 'monthly package',
      description:
          'Our most popular package! Get one full month of unlimited premium access for just 2,800 baht. Save significantly compared to daily purchases. Perfect for regular users who love our content. Includes all features, priority customer support, offline downloads, and no ads. Join thousands of satisfied customers today.',
      price: 2800,
      imageUrl:
          'https://img.freepik.com/premium-vector/2025-table-january-monthly-calendar-week-start-sunday-with-colorful-style_72039-3237.jpg',
      duration: Duration(days: 30),
    ),
    PackageDetailModel(
      id: 'pack4',
      name: 'yearly package',
      description:
          'Best value for money! Get an entire year of unlimited premium access for just 34,000 baht. That\'s less than 100 baht per day! Perfect for loyal customers and those who want maximum savings. Includes all premium features, 24/7 priority support, unlimited downloads, offline viewing, and exclusive annual member benefits. Lock in the lowest price today!',
      price: 34000,
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/071/022/537/non_2x/colorful-calendar-2026-2026-calendar-week-start-on-sunday-and-annual-schedule-grid-with-12-month-corporate-business-2026-wall-calendar-template-2026-planner-wall-calendar-week-starts-on-sunday-free-vector.jpg',
      duration: Duration(days: 365),
    ),
  ];
}
