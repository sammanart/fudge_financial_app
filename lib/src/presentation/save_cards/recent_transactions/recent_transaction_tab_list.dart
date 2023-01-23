import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/data/models/transaction.dart';
import 'package:fudge_financial_app/src/presentation/home/recent_transaction_list/recent_transaction_list.dart';

class RecentTransactionTabList extends StatefulWidget {
  const RecentTransactionTabList({super.key});

  @override
  State<RecentTransactionTabList> createState() =>
      _RecentTransactionTabListState();
}

class _RecentTransactionTabListState extends State<RecentTransactionTabList>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final _mockTransaction = <Transaction>[];
  final _view = <SingleChildScrollView>[];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    for (var i = 0; i < 10; i++) {
      _mockTransaction.add(
        Transaction(
          fullName: 'JOHN DOE',
          country: 'United Kingdom',
          price: '80,000',
          date: '11 Aug 2021',
          status:
              i == 0 ? TransactionStatus.pending : TransactionStatus.success,
        ),
      );
    }

    for (var i = 0; i < 4; i++) {
      _view.add(
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: RecentTransactionList(
            transactions: _mockTransaction,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 23),
            width: getWidth(context),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              border: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTabBar(theme),
              ],
            ),
          ),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Widget _buildTabBar(ThemeData theme) {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 4.0, color: AppColors.grey),
      ),
      unselectedLabelStyle: theme.textTheme.headline5!.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.fontGrey,
      ),
      tabs: [
        Tab(
          child: Text(
            "Menu title 1",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Menu title 2",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Menu title 3",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Menu title 4",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: theme.textTheme.headline5!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: TabBarView(
          controller: _tabController,
          children: _view,
        ),
      ),
    );
  }
}
