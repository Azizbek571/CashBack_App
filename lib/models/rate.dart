class RateModel{
  int id;
  int summa;
  int percent;
  int active;

  RateModel({
    required this.id,
    required this.active,
    required this.summa,
    required this.percent,
  });
  factory RateModel.fromJson(Map<String, dynamic>json){
    return RateModel(id: json['id'], active: json['active'], summa: json['summa'], percent: json['percent']);
  }
}

List<RateModel>rateListFromModel(List list){
  return List<RateModel>.from(list.map((e) => RateModel.fromJson(e)));
}