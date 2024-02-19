abstract class RegisterEvents{
  RegisterEvents();
}

class FirstNameEvent extends RegisterEvents{
  final String first_name;
  FirstNameEvent(this.first_name);
}



class LastNameEvent extends RegisterEvents{
  final String last_name;
  LastNameEvent(this.last_name);
}



class EmailEvent extends RegisterEvents{
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvents{
  final String password;
  PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvents{
  final String re_password;
  RePasswordEvent(this.re_password);
}
