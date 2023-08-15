import 'package:animate_do/animate_do.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:crypto_exchange/data/crypto.dart';
import 'package:crypto_exchange/data/crypto_log.dart';
import 'package:crypto_exchange/screens/cubit/app_state.dart';
import 'package:crypto_exchange/utlis/app_theme.dart';
import 'package:crypto_exchange/utlis/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utlis/colors.dart';
import 'cubit/app_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> listViewItemScaleAnimation;
  late Animation<double> listViewItemDefualtAnimation;

  late AnimationController listViewItemController;

  final bankListImage = ['assets/images/visa.png', 'assets/images/paypal.png'];

  final cryptoList = [
    Crypto(
      'Matic',
      'assets/images/matic.png',
      1.2737,
      7800.67,
      2.34,
      false,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
    Crypto(
      'USDT',
      'assets/images/usdt.png',
      700,
      5465.49,
      3.12,
      true,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
    Crypto(
      'ETH',
      'assets/images/ethereum.png',
      2.45845,
      560.49,
      5.70,
      true,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
    Crypto(
      'SAND',
      'assets/images/sand.png',
      1.5626,
      34.09,
      2.30,
      true,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
    Crypto(
      'USDC',
      'assets/images/usdc.png',
      1.2737,
      2587.13,
      3.60,
      false,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
    Crypto(
      'Bit',
      'assets/images/bitcoin.png',
      1.2737,
      9952.67,
      2.34,
      false,
      [
        CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    listViewItemController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    listViewItemScaleAnimation =
        Tween(begin: 1.0, end: 0.9).animate(listViewItemController);
    listViewItemDefualtAnimation =
        Tween(begin: 1.0, end: 1.0).animate(listViewItemController);
    context.read<AppCubit>().onStart();

    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  firstWidget(width, state),
                  if (state.topContainerHeight == 310) balncesWidget(),
                  cryptoListViewWidget(this, state),
                ],
              ),
              if (state.topContainerHeight == 310) bottomBarWidget(width)
            ],
          ),
        );
      },
    );
  }

  Container bottomBarWidget(double width) {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: darkGrey),
      height: 60,
      width: width,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 90,
            height: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: darkPurple),
            child: Container(
              margin: const EdgeInsets.only(right: 4, left: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.wallet,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    Strings.assets,
                    style: AppTheme.getTextTheme(null)
                        .bodyMedium!
                        .copyWith(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: const Icon(
              CupertinoIcons.search,
              color: grey,
              size: 24,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 65),
            child: const Icon(
              Icons.settings,
              size: 23,
              color: grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 65),
            child: const Icon(
              Icons.person_outline_sharp,
              size: 25,
              color: grey,
            ),
          )
        ],
      ),
    );
  }

  Container balncesWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 25),
      alignment: Alignment.topLeft,
      child: Text(
        Strings.balances,
        style: AppTheme.getTextTheme(null).titleLarge!.copyWith(fontSize: 32),
      ),
    );
  }

  Widget cryptoListViewWidget(TickerProvider provider, AppState state) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: cryptoList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final crypto = cryptoList[index];
          print('listview ${state.selectedCryptoIndex}');
          return FadeInUp(
            delay: Duration(milliseconds: 350 * index + 350),
            child: ScaleTransition(
              scale: index == state.selectedCryptoIndex
                  ? listViewItemScaleAnimation
                  : listViewItemDefualtAnimation,
              child: Listener(
                onPointerDown: (event) {
                  context.read<AppCubit>().onCryptoItemClicked(
                        index,
                      );
                  listViewItemController.forward();
                },
                onPointerUp: (event) {
                  listViewItemController.reverse();
                },
                child: Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(left: 16, top: index == 0 ? 0 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 25,
                                height: 25,
                                child: Image.asset(
                                  crypto.cryptoImage,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  crypto.cryptoName,
                                  style: AppTheme.getTextTheme(null).bodyLarge,
                                ),
                                Text('\$'
                                    '${crypto.cryptoPrice} ${crypto.cryptoName}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${crypto.cryptoChangedPrice}',
                              style: AppTheme.getTextTheme(null)
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                            ),
                            Row(
                              children: [
                                Icon(
                                  crypto.isIncrease
                                      ? CupertinoIcons.arrow_up_right
                                      : CupertinoIcons.arrow_down_right,
                                  color: crypto.isIncrease
                                      ? lightGreen
                                      : Colors.red,
                                  size: 22,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '${crypto.cryptoChangedPercentage}%',
                                  style: AppTheme.getTextTheme(null)
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          color: crypto.isIncrease
                                              ? lightGreen
                                              : Colors.red),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AnimatedContainer firstWidget(double width, AppState state) {
    return AnimatedContainer(
      width: width,
      height: double.parse('${state.topContainerHeight}'),
      duration: const Duration(milliseconds: 1100),
      decoration: BoxDecoration(
        color: pink,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(state.topContainerHeight == 310 ? 40 : 0),
          bottomRight:
              Radius.circular(state.topContainerHeight == 310 ? 40 : 0),
        ),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0, left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset('assets/images/profile.jpeg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.grey, width: 0.8),
                  ),
                  child: const Icon(Icons.settings, size: 19),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 20),
            child: Text(
              Strings.myBalance,
              style: AppTheme.getTextTheme(null).titleLarge!.copyWith(),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 5, left: 20),
            child: AnimatedDigitWidget(
              value: 2374.45,
              fractionDigits: 2,
              duration: const Duration(milliseconds: 1700),
              enableSeparator: true,
              prefix: "\$",
              textStyle: AppTheme.getTextTheme(null)
                  .titleLarge!
                  .copyWith(fontSize: 40),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return cartInfoWidget(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget cartInfoWidget(int index) {
    return FadeInLeft(
      duration: const Duration(seconds: 1),
      delay: Duration(milliseconds: 500 * index + 400),
      child: Container(
        width: 118,
        margin: EdgeInsets.only(right: 10, left: index == 0 ? 20 : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
            color: index != 2 ? Colors.transparent : darkPink),
        child: index != 2
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6, left: 6),
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          bankListImage[index],
                          height: 20,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      if (index == 0)
                        Container(
                          margin: const EdgeInsets.only(top: 5, right: 8),
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/images/crown.png',
                            width: 20,
                          ),
                        ),
                    ],
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          height: 5,
                          width: 30,
                          child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 2),
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.8)),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4, left: 2),
                          child: Text(
                            '9876',
                            style: AppTheme.getTextTheme(null).labelSmall,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: Text(Strings.addCard),
              ),
      ),
    );
  }
}
