

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}
class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "7",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Russia",
      example: "Russia",
      displayName: "Russia",
      displayNameNoCountryCode: "IN",
      e164Key: "",
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(        ////////декорация иконки звонка
                  shape: BoxShape.circle, color: Colors.purple.shade50
                ),
                child: Image.asset("assets/images/zvon.png"),
              ),
              const SizedBox(height: 20,), //////тротуар
              const Text("Регистрация",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),  //////////текст нижнее темнее
              const Text("добавьте ваш телефон.мы вышлем код",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                cursorColor: Colors.purple,
                controller: phoneController,
                onChanged: (value){
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration:  InputDecoration(
                  hintText: "номер телефона",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        showCountryPicker(context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect:(value) {
                          setState(() {
                            selectedCountry = value;
                          });
                        });
                      },
                      child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),
                  suffixIcon: phoneController.text.length >9 ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 20,
                    ),
                  ) : null,

                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}