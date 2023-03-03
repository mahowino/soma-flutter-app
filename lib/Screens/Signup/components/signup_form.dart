import 'package:flutter/material.dart';
import 'package:flutter_auth/Data/User/User.dart';
import 'package:flutter_auth/Data/User/userApi.dart';
import 'package:flutter_auth/Screens/Welcome/components/welcome_image.dart';
import 'package:provider/provider.dart';

import '../../../Data/User/UserViewHolder.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../MainPage/Mainpage.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController firstNameController=TextEditingController();
    TextEditingController lastNameController=TextEditingController();

    return Provider(
      create: (_)=>UserApiClass.create(),
      dispose: (_,UserApiClass userApiClass)=>userApiClass.client.dispose(),
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Your first name",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Your last name",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: const InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: passwordController,
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
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              onPressed: () async {
                String email=emailController.text.toString();
                String password=passwordController.text.toString();
                String firstName=passwordController.text.toString();
                String lastName=passwordController.text.toString();
                String? error=validatePass(firstName,lastName,email,password);
                if(error==null){
                  User user=User();
                  user.firstname=firstName;
                  user.lastname=lastName;
                  user.email=email;
                  user.password=password;

                  User? response=await UserClient.SignUpUser(user.toJson());
                  if(response!=null){

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("successful sign up"),
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

              child: Text("Sign Up".toUpperCase()),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );


    }

    String? validatePass(String firstName, String lastName,String email, String password) {
      if (email.isEmpty) {
        return "email is empty";
      }
      if (password.isEmpty) {
        return "password is empty";

      } if (firstName.isEmpty) {
        return "firstName is empty";
      }
      if (lastName.isEmpty) {
        return "lastName is empty";
      }


      if (password.length < 8) {
        return "password is too short";
      }


      return null;
    }
}