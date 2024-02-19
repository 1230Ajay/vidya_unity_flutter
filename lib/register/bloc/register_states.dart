class RegisterStates {
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? password;
  final String? re_password;

  const RegisterStates({this.first_name, this.email, this.password, this.re_password,this.last_name});

  RegisterStates copyWith(
      {String? first_name,
        String? last_name,
      String? email,
      String? password,
      String? re_password}) {
    return RegisterStates(
        first_name:first_name?? this.first_name,
        last_name: last_name??this.last_name,
        email: email ?? this.email,
        password: password ?? this.password,
        re_password: re_password ?? this.re_password);
  }
}
