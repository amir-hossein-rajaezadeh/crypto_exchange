import 'package:animate_do/animate_do.dart';
import 'package:crypto_exchange/cubit/app_cubit.dart';
import 'package:crypto_exchange/cubit/app_state.dart';
import 'package:crypto_exchange/data/crypto.dart';
import 'package:crypto_exchange/data/crypto_list.dart';
import 'package:crypto_exchange/utlis/app_theme.dart';
import 'package:crypto_exchange/utlis/colors.dart';
import 'package:crypto_exchange/utlis/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_digit/animated_digit.dart';

class CryptoDetailPage extends StatefulWidget {
  const CryptoDetailPage({super.key, required this.cryptoIndex});
  final int cryptoIndex;

  @override
  State<CryptoDetailPage> createState() => _CryptoDetailPageState();
}

class _CryptoDetailPageState extends State<CryptoDetailPage>
    with TickerProviderStateMixin {
  late Animation<Offset> cryptoTransactionsListAnimation;
  late Animation<Offset> sendAndBuyAnimation;
  late Animation<Offset> cryptoImageAnimation;
  late Animation<Offset> dollorValueAnimation;
  late AnimationController cryptoTransactionsListController;
  late AnimationController cryptoImageController;
  late Animation<Offset> cryptoValueAnimation;
  late AnimationController sendAndBuyController;
  late AnimationController dollorValueController;
  late AnimationController cryptoValueController;

  @override
  Widget build(BuildContext context) {
    sendAndBuyController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    cryptoValueController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    dollorValueController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    cryptoImageController = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );
    cryptoTransactionsListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    dollorValueAnimation = Tween<Offset>(
      begin: const Offset(0, -5),
      end: const Offset(0, 0),
    ).animate(
      dollorValueController,
    );

    cryptoValueAnimation = Tween<Offset>(
      begin: const Offset(0, -20),
      end: const Offset(0, 0),
    ).animate(
      cryptoValueController,
    );

    cryptoImageAnimation = Tween<Offset>(
      begin: const Offset(0, -6),
      end: const Offset(0, 0),
    ).animate(
      cryptoImageController,
    );
    sendAndBuyAnimation = Tween<Offset>(
      begin: const Offset(0, -8),
      end: const Offset(0, 0),
    ).animate(
      sendAndBuyController,
    );
    cryptoTransactionsListAnimation = Tween<Offset>(
      begin: const Offset(0, -2),
      end: const Offset(0, 0),
    ).animate(
      cryptoTransactionsListController,
    );
    context.read<AppCubit>().startCryptoPage(
        cryptoTransactionsListController,
        cryptoImageController,
        sendAndBuyController,
        dollorValueController,
        cryptoValueController);

    final crypto = addCryptoToList()[0];
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: pink,
            body: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 12, top: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: grey),
                            ),
                            child: const Center(
                                child: Icon(Icons.arrow_back_ios_new)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            margin: const EdgeInsets.only(right: 50, top: 0),
                            alignment: Alignment.center,
                            child: Text(
                              crypto.cryptoName,
                              style: AppTheme.getTextTheme(null)
                                  .bodyMedium!
                                  .copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                    SlideTransition(
                      position: cryptoImageAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            crypto.cryptoImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: dollorValueAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: AnimatedDigitWidget(
                          value: 5.49,
                          fractionDigits: 2,
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 2000),
                          enableSeparator: true,
                          prefix: "\$",
                          textStyle: AppTheme.getTextTheme(null)
                              .titleLarge!
                              .copyWith(fontSize: 40),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: cryptoValueAnimation,
                      child: AnimatedDigitWidget(
                        curve: Curves.bounceOut,
                        value: 0.19,
                        suffix: 'USDT',
                        textStyle: AppTheme.getTextTheme(null).bodySmall,
                      ),
                    ),
                    SlideTransition(
                      position: sendAndBuyAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 190,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: darkPink),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(CupertinoIcons.arrow_up_right),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        Strings.send,
                                        style: AppTheme.getTextTheme(null)
                                            .bodyMedium,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 190,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: darkPink),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(CupertinoIcons.creditcard),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        Strings.buy,
                                        style: AppTheme.getTextTheme(null)
                                            .bodyMedium,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SlideTransition(
                        position: cryptoTransactionsListAnimation,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: ListView.builder(
                            itemCount: crypto.cryptoTransactions.length,
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemBuilder: (context, wholeItemIndex) {
                              final cryptoTransactions =
                                  crypto.cryptoTransactions[wholeItemIndex];
                              return SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount:
                                      cryptoTransactions.cryptoLogs.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        cryptoTransactions.cryptoLogs[index] ==
                                                cryptoTransactions.cryptoLogs[0]
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20),
                                                child: Text(
                                                  cryptoTransactions.logDate,
                                                  style: AppTheme.getTextTheme(
                                                          null)
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: grey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                              )
                                            : Container(),
                                        transactionItemWidget(crypto, context,
                                            wholeItemIndex, index)
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget transactionItemWidget(
      Crypto crypto, BuildContext context, int wholeItemIndex, int index) {
    final cryptoTransactions = crypto.cryptoTransactions[wholeItemIndex];
    return FadeInDown(
      delay: Duration(milliseconds: (wholeItemIndex * 50) + 100),
      child: Container(
        margin: const EdgeInsets.only(top: 5, right: 15, left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 9),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: lightGrey),
              child: Icon(
                cryptoTransactions.cryptoLogs[index].isIncrease
                    ? CupertinoIcons.arrow_down_left
                    : CupertinoIcons.arrow_up_right,
                size: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 8,
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cryptoTransactions.cryptoLogs[index].isIncrease
                        ? Strings.received
                        : Strings.sent,
                    style: AppTheme.getTextTheme(null).bodyMedium,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cryptoTransactions.cryptoLogs[index].logSource,
                    style: AppTheme.getTextTheme(null).bodySmall,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 9),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${cryptoTransactions.cryptoLogs[index].isIncrease ? '+' : '-'}${cryptoTransactions.cryptoLogs[index].logPrice} USDT',
                      style: AppTheme.getTextTheme(null).bodyMedium!.copyWith(
                          fontSize: 15,
                          color: cryptoTransactions.cryptoLogs[index].isIncrease
                              ? Colors.green
                              : Colors.red),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                        '\$${cryptoTransactions.cryptoLogs[index].logPriceInDollar}',
                        style: AppTheme.getTextTheme(null).bodySmall!)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
