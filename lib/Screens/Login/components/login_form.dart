import 'package:flutter/material.dart';

import '../../../Data/User/User.dart';
import '../../../Data/User/UserViewHolder.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../MainPage/Mainpage.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController=TextEditingController();
    TextEditingController PasswordController=TextEditingController();
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: EmailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: PasswordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                String email=EmailController.text.toString();
                String password=PasswordController.text.toString();
                String? error = validatePass(email,password);

                if(error==null){
                  User user=User();
                  user.email=email;
                  user.password=password;

                  var response=await UserClient.logInUser(user.toJson());
                  if(response!=null){

                    print(response.credits);
                    print(response.userID);
                    print(response.token);
                    print(response.email);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("successful sign in"),
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)  {

                          return  MainPage(response);
                        },
                      ),
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error, issue with credentials or network"),
                    ));
                  }

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error),
                  ));
                }


              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  String? validatePass(String email, String password) {
    if (email.isEmpty) {
      return "email is empty";
    }
    if (password.isEmpty) {
      return "password is empty";
    }

    if (password.length < 8) {
      return "password is too short";
    }

    return null;
  }
}
