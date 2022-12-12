// To parse this JSON data, do
//
//     final redeemList = redeemListFromJson(jsonString);

import 'dart:convert';

List<RedeemList> redeemListFromJson(String str) => List<RedeemList>.from(json.decode(str).map((x) => RedeemList.fromJson(x)));

String redeemListToJson(List<RedeemList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RedeemList {
  RedeemList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int? pk;
  Fields fields;

  factory RedeemList.fromJson(Map<String, dynamic> json) => RedeemList(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.jenisVoucher,
    required this.titleVoucher,
    required this.hargaPoin,
    required this.deskripsi,
  });

  JenisVoucher? jenisVoucher;
  String titleVoucher;
  int hargaPoin;
  String deskripsi;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    jenisVoucher: jenisVoucherValues.map[json["jenisVoucher"]],
    titleVoucher: json["title_voucher"],
    hargaPoin: json["harga_poin"],
    deskripsi: json["deskripsi"],
  );

  Map<String, dynamic> toJson() => {
    "jenis_voucher": jenisVoucherValues.reverse[jenisVoucher],
    "title_voucher": titleVoucher,
    "harga_poin": hargaPoin,
    "deskripsi": deskripsi,
  };
}

enum JenisVoucher { VOUCHER_BELANJA, PULSA, VOUCHER_MERCHANT }

final jenisVoucherValues = EnumValues({
  "pulsa": JenisVoucher.PULSA,
  "voucher belanja": JenisVoucher.VOUCHER_BELANJA,
  "voucher merchant": JenisVoucher.VOUCHER_MERCHANT
});

enum Model { REDEEM_VOUCHER }

final modelValues = EnumValues({
  "redeem.voucher": Model.REDEEM_VOUCHER
});

class EnumValues<T> {
  Map<String, T>  map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
