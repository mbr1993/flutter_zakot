enum ZakatCurrencyEnum {
  sum(0, 'So`m'),
  usd(1, 'USD'),
  euro(2, 'Euro'),
  rub(3, 'Rub'),
  kzt(4, 'Kzt');

  const ZakatCurrencyEnum(this.value, this.label);

  final int value;
  final String label;
}