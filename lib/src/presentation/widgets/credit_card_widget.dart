import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/images.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/core/utils/currency_utils.dart';
import 'package:fudge_financial_app/src/data/models/credit_card.dart';

class CreditCardWidget extends StatelessWidget {
  final List<Color> gradientColors;
  final CreditCard creditCard;
  const CreditCardWidget({
    super.key,
    required this.gradientColors,
    required this.creditCard,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blueCharcoal,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.4, 1],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMicroChip(),
              _buildCardType(),
            ],
          ),
          _buildCardNumber(theme),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardHolder(theme),
              const Spacer(flex: 4),
              _buildExpDate(theme),
              const Spacer(),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget _buildMicroChip() {
    return Image.asset(
      Images.microChip,
      width: 45,
    );
  }

  Widget _buildCardType() {
    String image;
    if (creditCard.cardType == CardType.visa) {
      image = Images.visa;
    } else {
      image = Images.master;
    }
    return Image.asset(
      image,
      width: 50,
      height: 50,
      // color: AppColors.white,
    );
  }

  Widget _buildCardNumber(ThemeData theme) {
    final cardNumberList = splitCardNumber(creditCard.cardNumber);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          cardNumberList.length,
          (index) => Text(
            cardNumberList[index].toString(),
            style: theme.textTheme.headline2,
          ),
        ),
      ),
    );
  }

  Widget _buildCardHolder(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'c a r d'.toUpperCase(),
          style: theme.textTheme.headline6!
              .copyWith(fontSize: 8, fontWeight: FontWeight.w300),
        ),
        verticalMargin(3),
        Text(
          creditCard.cardHolderName.toUpperCase(),
          style: theme.textTheme.headline5,
        )
      ],
    );
  }

  Widget _buildExpDate(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(
            'expires'.toUpperCase(),
            style: theme.textTheme.headline6!.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        verticalMargin(3),
        Text(
          '09/22',
          style: theme.textTheme.headline4!.copyWith(),
        )
      ],
    );
  }
}
