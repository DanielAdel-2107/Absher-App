class PaymentModel {
  final String? mahfzaNumber;
  final String? cardNumber;
  final String? bankName;
  final String? instapayEmail;

  PaymentModel(
      {required this.mahfzaNumber,
      required this.cardNumber,
      required this.bankName,
      required this.instapayEmail});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      mahfzaNumber: json['mahfza_number'] ?? "",
      cardNumber: json['card_number'] ?? "",
      bankName: json['bank_name'] ?? "",
      instapayEmail: json['instapay_email'] ?? "",
    );
  }

  @override
  String toString() {
    return ('PaymentModel{mahfzaNumber: $mahfzaNumber, cardNumber: $cardNumber, bankName: $bankName, instapayEmail: $instapayEmail, }');
  }
}
