import 'package:database/Screens/category/expense_category_list.dart';
import 'package:database/Screens/category/income_category_list.dart';
import 'package:database/db/category/category_db..dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory ({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
          Tab(text: 'INCOME'),
          Tab(text: 'EXPENSE'),
        ]
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
              children: const [
                IncomeCategoryList(),
                ExpenseCategoryList(),
              ]
          ),
        )
      ],
    );
  }
}
