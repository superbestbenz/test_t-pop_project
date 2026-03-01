import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart';

// Simple API implementation - no need to subclass unless mocking in tests.
class PackageApi {
  Future<List<PackageDetailModel>> getPackageDetail() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        PackageDetailModel(
          id: 'pack1',
          name: 'daily package',
          description:
              'Perfect for daily users. Get access to all features every day for just 100 baht',
          price: 100,
          imageUrl:
              'https://media.istockphoto.com/id/1131812584/vector/day-calendar-with-date-march-22.jpg?s=612x612&w=0&k=20&c=c7rd0-3BI6CKN_eGQMl24SkHe_u7DLq3IqLr4LYcAKs=',
        ),
        PackageDetailModel(
          id: 'pack2',
          name: 'weekly package',
          description:
              'Enjoy a full week of premium access. Great value at 690 baht per week',
          price: 690,
          imageUrl:
              'https://marketplace.canva.com/EAGGin98LIc/2/0/1600w/canva-orange-and-white-floral-weekly-calendar-G77HiFQzkQ0.jpg',
        ),
        PackageDetailModel(
          id: 'pack3',
          name: 'monthly package',
          description:
              'Save more with our monthly plan. Unlimited access for one month at 2,800 baht',
          price: 2800,
          imageUrl:
              'https://img.freepik.com/premium-vector/2025-table-january-monthly-calendar-week-start-sunday-with-colorful-style_72039-3237.jpg',
        ),
        PackageDetailModel(
          id: 'pack4',
          name: 'yearly package',
          description:
              'Best value! Get a full year of premium access for 34,000 baht. Maximum savings',
          price: 34000,
          imageUrl:
              'https://static.vecteezy.com/system/resources/previews/071/022/537/non_2x/colorful-calendar-2026-2026-calendar-week-start-on-sunday-and-annual-schedule-grid-with-12-month-corporate-business-2026-wall-calendar-template-2026-planner-wall-calendar-week-starts-on-sunday-free-vector.jpg',
        ),
      ],
    );
  }
}
