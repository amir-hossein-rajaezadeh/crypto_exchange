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

class CryptoDetailPage extends StatelessWidget {
  const CryptoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crypto = addCryptoToList()[0];
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
                    Container(
                      margin: const EdgeInsets.only(left: 12, top: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: grey),
                      ),
                      child:
                          const Center(child: Icon(Icons.arrow_back_ios_new)),
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
                Container(
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    crypto.cryptoChangedPrice.toString(),
                    style: AppTheme.getTextTheme(null)
                        .titleLarge!
                        .copyWith(fontSize: 40),
                  ),
                ),
                Text(
                  '0.19 USDT',
                  style: AppTheme.getTextTheme(null).bodySmall,
                ),
                Container(
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
                                  style: AppTheme.getTextTheme(null).bodyMedium,
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
                                  style: AppTheme.getTextTheme(null).bodyMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
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
                                    crypto, context, wholeItemIndex, index)
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Container transactionItemWidget(
      Crypto crypto, BuildContext context, int wholeItemIndex, int index) {
    final cryptoTransactions = crypto.cryptoTransactions[wholeItemIndex];
    return Container(
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
    );
  }
}
