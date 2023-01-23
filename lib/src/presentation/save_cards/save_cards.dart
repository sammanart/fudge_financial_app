import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/data/models/credit_card.dart';
import 'package:fudge_financial_app/src/presentation/save_cards/app_bar/save__card_app_bar.dart';
import 'package:fudge_financial_app/src/presentation/save_cards/recent_transactions/recent_transaction_tab_list.dart';
import 'package:fudge_financial_app/src/presentation/widgets/credit_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SavedCards extends StatelessWidget {
  SavedCards({super.key});
  final controller = PageController(
    viewportFraction: 0.8,
    keepPage: false,
  );

  final _mockCreditCards = [
    CreditCardWidget(
      gradientColors: const [
        AppColors.darkBlue,
        AppColors.darkPurple,
      ],
      creditCard: CreditCard(
        cardHolderName: 'ugur ates',
        cardNumber: '4349434945787029',
        cardType: CardType.visa,
        expiryDate: DateTime(DateTime.now().year + 4),
      ),
    ),
    CreditCardWidget(
      gradientColors: [
        AppColors.darkGreen,
        AppColors.darkGreen.withOpacity(0.8)
      ],
      creditCard: CreditCard(
        cardHolderName: 'test test',
        cardNumber: '5501445566443322',
        cardType: CardType.master,
        expiryDate: DateTime(DateTime.now().year + 4),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(getWidth(context), 56),
        child: const SaveCardAppBar(),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 185,
            child: PageView.builder(
              itemCount: 2,
              controller: controller,
              padEnds: false,
              itemBuilder: (_, index) {
                return Container(
                  child: _mockCreditCards[index % _mockCreditCards.length],
                );
              },
            ),
          ),
          verticalMargin(20),
          SmoothPageIndicator(
            controller: controller,
            count: 2,
            axisDirection: Axis.horizontal,
            effect: const ExpandingDotsEffect(
              spacing: 10,
              radius: 10,
              dotWidth: 10,
              dotHeight: 7,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey,
              activeDotColor: AppColors.black,
              expansionFactor: 2,
            ),
          ),
          const RecentTransactionTabList()
        ],
      ),
    );
  }
}
