class Datas {
  String id;
  String stockDate;
  String materialName;
  String materialFrom;
  String materialCost;
  String vehicleType;
  String vehicleRate;
  String vatBill;


  Datas({this.id, this.stockDate,
    this.materialName, this.materialFrom, this.materialCost, this.vehicleType
    , this.vehicleRate, this.vatBill});

  factory Datas.fromJson(Map<String, dynamic> json) {
    return Datas(
      id: json['id'] as String,
      stockDate: json['DateData'] as String,
      materialName: json['materialName'] as String,
      materialFrom: json['materialFrom'] as String,
      materialCost: json['materialCost'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleRate: json['vehicleRate'] as String,
      vatBill: json['bill'] as String,
    );
  }
}
