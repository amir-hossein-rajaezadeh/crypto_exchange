import 'crypto.dart';
import 'crypto_log.dart';
import 'crypto_transactions.dart';

List<Crypto> addCryptoToList() {
  return cryptoList;
}

final cryptoList = [
  Crypto(
    'Matic',
    'assets/images/matic.png',
    1.2737,
    7800.67,
    2.34,
    false,
    [
      CryptoTransactions(
        'Saterday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      ),
      CryptoTransactions(
        'Sunday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 20, 0.80),
        ],
      ),
      CryptoTransactions(
        'Monday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 80, 0.45),
        ],
      ),
      CryptoTransactions(
        'Tuesday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 20, 0.12),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 70, 0.60),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 40, 0.15),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 10, 0.05),
        ],
      )
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
      CryptoTransactions(
        'logDate',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      )
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
      CryptoTransactions(
        'logDate',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      )
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
      CryptoTransactions(
        'logDate',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      )
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
      CryptoTransactions(
        'logDate',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      )
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
      CryptoTransactions(
        'logDate',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      )
    ],
  ),
];
