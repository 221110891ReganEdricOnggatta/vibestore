class Customer {
  String? id;
  final String email;
  final String nama;
  final String password;

  Customer(
      {this.id,
      required this.email,
      required this.nama,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nama': nama,
      'password': password,
    };
  }
}
