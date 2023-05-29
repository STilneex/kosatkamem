import 'package:flutter/material.dart';
import 'package:kosatkamem/screen/reqister_screen.dart';
import 'package:kosatkamem/widgets/custom_button.dart';







class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

}
class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/kosatka.png",
                height: 300,


                ),
                const SizedBox(height: 20,), ////основной текст по середине
                const Text("Kosatka messange",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10,),  //////////текст нижнее темнее
                const Text("hever",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,), ////// кнопка переход на экран регистрации
                SizedBox(
                  width:  double.infinity,
                  height: 50,
                  child: CustomButtom(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                          ),
                      );
                    },

                    text: "Get start",
                  ),
                ),


              ],
            ),
          ),
        ),

      ),
    );
  }
}