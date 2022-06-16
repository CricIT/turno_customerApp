class EMI {
  double? amount;
  int? dueDate;

  EMI({
    this.amount,
    this.dueDate,
  });

  factory EMI.fromJson(Map<String, dynamic>? json) {
    return EMI(
      amount: json?['amount'],
      dueDate: json?['dateInMs'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'dateInMs': dueDate,
      };
}
