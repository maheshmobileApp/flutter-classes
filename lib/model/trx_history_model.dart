class TransHistoryMode {
  final String? errors;
  final List<TransModel>? trxHistoryDetails;
  TransHistoryMode({this.errors, this.trxHistoryDetails});

  factory TransHistoryMode.fromJson(Map<String, dynamic> json) =>
      TransHistoryMode(
        errors: json["errors"],
        trxHistoryDetails: List<TransModel>.from(
            json["trxHistoryDetails"].map((x) => TransModel.fromJson(x))),
      );
}

class TransModel {
  final String? trxDateTime;
  final String? cardNbr;
  final String? retailerName;
  final String? retailerLocation;
  final String? benefitType;
  final int? amount;

  TransModel(
      {this.trxDateTime,
      this.cardNbr,
      this.retailerLocation,
      this.retailerName,
      this.amount,
      this.benefitType});

  factory TransModel.fromJson(Map<String, dynamic> json) => TransModel(
        trxDateTime: json["trxDatetime"],
        cardNbr: json["cardNbr"],
        retailerName: json["retailerName"],
        retailerLocation: json["retailerLocation"],
        benefitType: json["benefitType"],
        amount: json["amount"],
      );
}



/*

{
            "trxDatetime": "12/03/2020 23:01:02",
            "cardNbr": "2UcKoqrj3gQbMnvO78wd/w==r",
            "retailerName": "CONVENIENCE",
            "retailerLocation": "00000000012 TEST LN PITTSB",
            "benefitType": "S",
            "trxType": "FOOD STAMP PURCHASE",
            "amount": 26,
            "debitOrCredit": "D",
            "retailerCategoryName": null
        },
class className {

  final String? trxDateTime;

className({ this.trxDateTime})

}

final obj =  className(trxDateTime:123);

 */

/*

{
            "trxDatetime": "12/03/2020 23:01:02",
            "cardNbr": "2UcKoqrj3gQbMnvO78wd/w==r",
            "retailerName": "CONVENIENCE",
            "retailerLocation": "00000000012 TEST LN PITTSB",
            "benefitType": "S",
            "trxType": "FOOD STAMP PURCHASE",
            "amount": 26,
            "debitOrCredit": "D",
            "retailerCategoryName": null
        },
 */