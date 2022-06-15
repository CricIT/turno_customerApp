class EMI {
  double? amount;
  String? dueDate;

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

class EmiHistory {
  double? totalAmountPaid;
  List<EMI>? emiHistory;

  EmiHistory({
    this.totalAmountPaid,
    this.emiHistory,
  });

  EmiHistory.fromJson(Map<String, dynamic> json) {
    totalAmountPaid = json['totalAmountPaid'];
    if (json['emiHistory'] != null) {
      emiHistory = <EMI>[];
      json['emiHistory'].forEach((v) {
        emiHistory?.add(EMI.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalAmountPaid'] = totalAmountPaid;
    if (emiHistory != null) {
      data['emiHistory'] = emiHistory?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
