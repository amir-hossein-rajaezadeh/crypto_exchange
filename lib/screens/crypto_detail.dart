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
import 'package:flutter/services.dart';

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
  late Animation<double> sendButtonScaleAnimation;
  late Animation<double> sendButtonDefualtAnimation;
  late AnimationController sendButtonController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //Cahnge  status  bar color to pink
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: pink,
    ));
    sendButtonController = AnimationController(
      duration: const Duration(milliseconds: 10),
      vsync: this,
    );
    sendButtonScaleAnimation =
        Tween(begin: 1.0, end: 0.9).animate(sendButtonController);
    sendButtonDefualtAnimation =
        Tween(begin: 1.0, end: 1.0).animate(sendButtonController);

    sendAndBuyController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    cryptoValueController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    dollorValueController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    cryptoImageController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );
    cryptoTransactionsListController = AnimationController(
      duration: const Duration(milliseconds: 1100),
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

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: pink,
            body: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    cryptoDetailWidget(context, width, state),
                    cryptoCalculatorWidget(state, width)
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Column cryptoDetailWidget(
      BuildContext context, double width, AppState state) {
    final crypto = addCryptoToList()[state.selectedCryptoIndex];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.read<AppCubit>().onBackButtonPressed(
                      false,
                      context,
                    );
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
                  child: Icon(Icons.arrow_back_ios_new),
                ),
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
                borderRadius: BorderRadius.circular(15), color: Colors.white),
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
              value: crypto.cryptoPrice,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 25,
                child: Text(
                  '${crypto.cryptoPrice / crypto.cryptoChangedPrice}',
                  style: AppTheme.getTextTheme(null)
                      .bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                ' ${crypto.cryptoName}',
                style: AppTheme.getTextTheme(null)
                    .bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SlideTransition(
          position: sendAndBuyAnimation,
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(top: 20, left: 12),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ScaleTransition(
                  scale: index == 0
                      ? sendButtonScaleAnimation
                      : sendButtonDefualtAnimation,
                  child: Listener(
                    onPointerDown: (event) {
                      context.read<AppCubit>().onSendButtonPressed();
                      sendButtonController.forward();
                    },
                    onPointerUp: (event) {
                      sendButtonController.reverse();
                    },
                    child: Container(
                      height: 50,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: darkPink),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Icon(index == 0
                                    ? CupertinoIcons.arrow_up_right
                                    : CupertinoIcons.creditcard),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  index == 0 ? Strings.send : Strings.buy,
                                  style: AppTheme.getTextTheme(null).bodyMedium,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
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
                      itemCount: cryptoTransactions.cryptoLogs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cryptoTransactions.cryptoLogs[index] ==
                                    cryptoTransactions.cryptoLogs[0]
                                ? Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      cryptoTransactions.logDate,
                                      style: AppTheme.getTextTheme(null)
                                          .bodyMedium!
                                          .copyWith(
                                              color: grey,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  )
                                : Container(),
                            transactionItemWidget(
                                crypto, context, wholeItemIndex, index, width)
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
  }

  AnimatedContainer cryptoCalculatorWidget(AppState state, double width) {
    final cryptoItem = cryptoList[state.selectedCryptoIndex];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1200),
      height: state.showCryptoCalculator ? 800 : 0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<AppCubit>()
                              .onBackButtonPressed(true, context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 22, left: 18),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new_outlined,
                              size: 20),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 60, top: 15),
                            child: Text(
                              cryptoItem.cryptoName,
                              style: AppTheme.getTextTheme(null)
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: const EdgeInsets.only(right: 15, left: 15, top: 20),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: purple,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 25),
                        child: Text(
                          Strings.reception,
                          style: AppTheme.getTextTheme(null)
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 25),
                        child: Text(
                          Strings.interpriseSystem,
                          style: AppTheme.getTextTheme(null)
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: verylightGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 0, left: 20),
                            child: Text(
                              Strings.amount,
                              style: AppTheme.getTextTheme(null)
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: AnimatedDigitWidget(
                              value: state.selectedNumber,
                              prefix: '\$',
                              duration: const Duration(milliseconds: 800),
                              fractionDigits: 2,
                              enableSeparator: true,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 160,
                        height: 30,
                        margin: const EdgeInsets.only(right: 15),
                        child: Text(
                          '=${context.read<AppCubit>().calculatedPrice(cryptoItem.cryptoChangedPrice)}',
                          style: AppTheme.getTextTheme(null)
                              .titleLarge!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: mediumGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  height: 340,
                  child: GridView.count(
                    childAspectRatio: 3.2 / 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                      12,
                      (index) {
                        return FadeInUp(
                          delay: Duration(milliseconds: 3300 + (180 * index)),
                          child: index == 11
                              ? const Icon(Icons.backspace_outlined)
                              : index == 9
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        context
                                            .read<AppCubit>()
                                            .doCalculation(index + 1);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: lightGrey),
                                        child: Center(
                                          child: Text(
                                            index == 10 ? '0' : '${index + 1}',
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                    ),
                        );
                      },
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 4800),
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: lightBlack),
                    height: 50,
                    child: Center(
                      child: Text(
                        Strings.send,
                        style: AppTheme.getTextTheme(null)
                            .bodyMedium!
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionItemWidget(Crypto crypto, BuildContext context,
      int wholeItemIndex, int index, double width) {
    final cryptoTransactions = crypto.cryptoTransactions[wholeItemIndex];
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350 * index + 350),
      opacity: 1,
      child: Container(
        margin: const EdgeInsets.only(top: 5, right: 15, left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        height: 60,
        width: width,
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
