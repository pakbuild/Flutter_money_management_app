import 'package:flutter/material.dart';
import 'package:money_manage_app/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_manage_app/screens/category/category_add_popup.dart';
import 'package:money_manage_app/screens/category/screen_category.dart';
import 'package:money_manage_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_manage_app/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 48, 55),
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: ((BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add transaction');
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } else {
            print('Add category');
            showCategoryAddPopup(context);
            //final _sample = CategoryModel(
            //id: DateTime.now().millisecondsSinceEpoch.toString(),
            //name: 'Travel',
            //type: CategoryType.expense,
            //);
            //CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
