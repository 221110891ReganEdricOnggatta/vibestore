class Customer {
  final String email;
  final String nama;
  final String password;

  Customer({required this.email, required this.nama, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nama': nama,
      'password': password,
    };
  }
}
