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
        ],
      )
    ],
  ),
  Crypto(
    'USDT',
    'assets/images/usdt.png',
    5.49,
    5465.49,
    3.12,
    true,
    [
      CryptoTransactions(
        'Monday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 50, 0.24),
        ],
      ),
      CryptoTransactions(
        'Friday',
        [
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 80, 0.32),
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 20, 0.12),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 60, 0.85),
        ],
      )
    ],
  ),
  Crypto(
    'ETH',
    'assets/images/ethereum.png',
    2.45,
    540.49,
    5.70,
    true,
    [
      CryptoTransactions(
        'Tuesday',
        [
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 120, 1.5),
        ],
      )
    ],
  ),
  Crypto(
    'SAND',
    'assets/images/sand.png',
    1.56,
    34.09,
    2.30,
    true,
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
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 20, 0.12),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 70, 0.60),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 40, 0.15),
        ],
      )
    ],
  ),
  Crypto(
    'USDC',
    'assets/images/usdc.png',
    1.27,
    2587.13,
    3.60,
    false,
    [],
  ),
  Crypto(
    'Bitcoin',
    'assets/images/bitcoin.png',
    1.27,
    26033.28,
    2.34,
    false,
    [
      CryptoTransactions(
        'Tuesday',
        [
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 51, 8),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 12, 0.5),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 87, 0.72),
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 69, 0.6),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 81, 0.8),
          CryptoLog(false, 'Tgdjdjosmctksaqmefn.lui2', 35, 0.2),
          CryptoLog(true, 'Tgdjdjosmctksaqmefn.lui2', 46, 0.4),
        ],
      )
    ],
  ),
];
