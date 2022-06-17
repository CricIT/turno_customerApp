import 'package:turno_customer_application/domain/entities/emi.dart';

class EmiHistory {
  EmiHistory({
    required this.totalAmountPaid,
    required this.emiHistory,
  });

  double totalAmountPaid;
  List<EMI> emiHistory;

  factory EmiHistory.fromJson(Map<String, dynamic> json) {
    List<EMI> emiHistory = [];
    for (var element in json['emiHistory']) {
      print(element);
      emiHistory.add(EMI.fromJson(element));
    }

    return EmiHistory(
      totalAmountPaid: json["totalAmountPaid"],
      emiHistory: emiHistory,
    );
  }
}
