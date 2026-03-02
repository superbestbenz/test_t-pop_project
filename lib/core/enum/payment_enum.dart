enum PaymentMethod {
  creditCard("Credit Card"),
  bankTransfer("Bank Transfer"),
  mobileWallet("Mobile Wallet");

  final String label;

  const PaymentMethod(this.label);
}
