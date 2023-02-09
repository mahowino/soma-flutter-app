class AuthViewModel
{
  late String email,password;
  void AuthenticateUser(String email, String password){
    this.email=email;
    this.password=password;
  }
}