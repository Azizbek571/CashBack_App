class CustomerModel {
  int id;
  String name;
  String username;
  String code;
  dynamic summa;
  int active;
  dynamic output;
  dynamic input;


  CustomerModel({
    required this.code,
    required this.id,
    required this.name,
    required this.summa,
    required this.username,
    required this.active,
    required this.output,
    required this.input,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        code: json['code'],
        id: json['id'],
        name: json['name'],
        summa: json['summa'],
        active: json['active'],
        output: json['output'],
        input: json['input'],
        username: json['username']);
  }
}

  List<CustomerModel> listFromCustomerModel(List list){
    return List<CustomerModel>.from(list.map((e) => CustomerModel.fromJson(e)));
  }


