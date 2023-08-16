import 'crypto_transactions.dart';

class Crypto {
  final String cryptoName;
  final String cryptoImage;
  final double cryptoChangedPercentage;
  final double cryptoChangedPrice;
  final double cryptoPrice;
  final bool isIncrease;
  final List<CryptoTransactions> cryptoTransactions;
  Crypto(
    this.cryptoName,
    this.cryptoImage,
    this.cryptoPrice,
    this.cryptoChangedPrice,
    this.cryptoChangedPercentage,
    this.isIncrease,
    this.cryptoTransactions,
  );
}
