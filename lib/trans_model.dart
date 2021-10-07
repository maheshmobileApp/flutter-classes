class SampleModel {
  String? errors;
  List<TrxHistoryDetails>? trxHistoryDetails;

  SampleModel({this.errors, this.trxHistoryDetails});

  SampleModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['trxHistoryDetails'] != null) {
      trxHistoryDetails = [];
      json['trxHistoryDetails'].forEach((v) {
        trxHistoryDetails!.add(new TrxHistoryDetails.fromJson(v));
      });
    }
  }
}

class TrxHistoryDetails {
  String? trxDatetime;
  String? cardNbr;
  String? retailerName;
  String? retailerLocation;
  String? benefitType;
  String? trxType;
  int? amount;
  String? debitOrCredit;
  String? retailerCategoryName;

  TrxHistoryDetails(
      {this.trxDatetime,
      this.cardNbr,
      this.retailerName,
      this.retailerLocation,
      this.benefitType,
      this.trxType,
      this.amount,
      this.debitOrCredit,
      this.retailerCategoryName});

  TrxHistoryDetails.fromJson(Map<String, dynamic> json) {
    trxDatetime = json['trxDatetime'];
    cardNbr = json['cardNbr'];
    retailerName = json['retailerName'];
    retailerLocation = json['retailerLocation'];
    benefitType = json['benefitType'];
    trxType = json['trxType'];
    amount = json['amount'];
    debitOrCredit = json['debitOrCredit'];
    retailerCategoryName = json['retailerCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trxDatetime'] = this.trxDatetime;
    data['cardNbr'] = this.cardNbr;
    data['retailerName'] = this.retailerName;
    data['retailerLocation'] = this.retailerLocation;
    data['benefitType'] = this.benefitType;
    data['trxType'] = this.trxType;
    data['amount'] = this.amount;
    data['debitOrCredit'] = this.debitOrCredit;
    data['retailerCategoryName'] = this.retailerCategoryName;
    return data;
  }
}
