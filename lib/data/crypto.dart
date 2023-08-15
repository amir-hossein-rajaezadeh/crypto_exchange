import 'crypto_log.dart';

class Crypto {
  final String cryptoName;
  final String cryptoImage;
  final double cryptoChangedPercentage;
  final double cryptoChangedPrice;
  final double cryptoPrice;
  final bool isIncrease;
  final List<CryptoLog> cryptoLog;
  Crypto(
    this.cryptoName,
    this.cryptoImage,
    this.cryptoPrice,
    this.cryptoChangedPrice,
    this.cryptoChangedPercentage,
    this.isIncrease,
    this.cryptoLog,
  );
}
