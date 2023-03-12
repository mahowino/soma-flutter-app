import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:provider/provider.dart';

import '../../Data/Providers/AuthProvider.dart';
import '../../constants.dart';

class Mpesa extends StatefulWidget {

  const Mpesa({Key? key}) : super(key: key);

  @override
  State<Mpesa> createState() => _MpesaState();
}

class _MpesaState extends State<Mpesa> {
  TextEditingController phoneToPay=TextEditingController();
  TextEditingController amount=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mpesa payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding*4),
              TextFormField(
                controller: phoneToPay,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintText: "Number to pay",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: amount,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "amount",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Hero(
                tag: "send prompt",
                child: ElevatedButton(
                  onPressed: () async {
                    String phone=phoneToPay.text.toString();
                    String amountToPay=amount.text.toString();
                    String? error = validate(phone,amountToPay);

                    if(error==null){


                      dynamic transactionInitialisation;
                      //Wrap it with a try-catch
                      try {
                        var uid=Provider.of<AuthProvider>(context).user.userID;

                        //Run it
                        transactionInitialisation =
                        await MpesaFlutterPlugin.initializeMpesaSTKPush(
                            businessShortCode: "174379",//use your store number if the transaction type is CustomerBuyGoodsOnline
                            transactionType: TransactionType.CustomerBuyGoodsOnline, //or CustomerBuyGoodsOnline for till numbers
                            amount: double.parse(amountToPay),
                            partyA: phone,
                            partyB: "174379",
                            callBackURL: Uri.parse("https://us-central1-soma-f84cc.cloudfunctions.net/callbackUrl?userid="+uid!),
                            accountReference: "123123",
                            phoneNumber: phone,
                            baseUri: Uri.parse("https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"),
                            transactionDesc: "hi",
                            passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

                        print(transactionInitialisation);

                      } catch (e) {
                        //you can implement your exception handling here.
                        //Network un-reachability is a sure exception.

                        /*
    Other 'throws':
    1. Amount being less than 1.0
    2. Consumer Secret/Key not set
    3. Phone number is less than 9 characters
    4. Phone number not in international format(should start with 254 for KE)
     */

                        print("error");
                      }

                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(error),
                      ));
                    }


                  },
                  child: Text(
                    "send prompt".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),

            ],
          ),
        ),
      ),
    );
  }
  String? validate(String phone, String amount) {
    if (phone.isEmpty) {
      return "phone is empty";
    }
    if (amount.isEmpty) {
      return "amount is empty";
    }

    if (phone.length !=12 ) {
      return "write valid number";
    }

    return null;
  }
}
