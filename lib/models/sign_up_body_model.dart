class SignUpBodyModel {
  String name;
  String phone;
  String password;
  String email;
  SignUpBodyModel({
    required this.name,
    required this.password,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = name;
    data['phone'] = phone;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
