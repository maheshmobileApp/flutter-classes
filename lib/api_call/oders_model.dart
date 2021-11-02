class OrdersModel {
  String? message;
  List<CpOrders>? cpOrders;
  Pagination? pagination;

  OrdersModel({this.message, this.cpOrders, this.pagination});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cp_orders'] != null) {
      cpOrders = [];
      json['cp_orders'].forEach((v) {
        cpOrders?.add(new CpOrders.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }
}

class CpOrders {
  String? id;
  String? type;
  String? submitDate;
  String? createdAt;
  String? updatedAt;
  File? file;
  int? orderId;
  String? firstSenderName;
  String? firstSenderCity;
  String? firstRecipientName;
  String? firstRecipientCity;
  List<Parcels>? parcels;

  CpOrders(
      {this.id,
      this.type,
      this.submitDate,
      this.createdAt,
      this.updatedAt,
      this.file,
      this.orderId,
      this.firstSenderName,
      this.firstSenderCity,
      this.firstRecipientName,
      this.firstRecipientCity,
      this.parcels});

  CpOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    submitDate = json['submit_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    orderId = json['order_id'];
    firstSenderName = json['first_sender_name'];
    firstSenderCity = json['first_sender_city'];
    firstRecipientName = json['first_recipient_name'];
    firstRecipientCity = json['first_recipient_city'];
    if (json['parcels'] != null) {
      parcels = [];
      json['parcels'].forEach((v) {
        parcels?.add(new Parcels.fromJson(v));
      });
    }
  }
}

class File {
  String? barcode;

  File({this.barcode});

  File.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    return data;
  }
}

class Parcels {
  String? description;
  Type? type;
  Sender? sender;
  Sender? recipient;

  Parcels({this.description, this.type, this.sender, this.recipient});

  Parcels.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    recipient = json['recipient'] != null
        ? new Sender.fromJson(json['recipient'])
        : null;
  }
}

class Type {
  int? code;
  String? description;

  Type({this.code, this.description});

  Type.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class Sender {
  String? name;
  String? city;

  Sender({this.name, this.city});

  Sender.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}

class Pagination {
  int? totalPage;
  int? page;
  int? perPage;

  Pagination({this.totalPage, this.page, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalPage = json['total_page'];
    page = json['page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_page'] = this.totalPage;
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    return data;
  }
}
