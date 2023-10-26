//import 'package:diabsuivi/app/modules/home/views/home_view.dart';
//import 'package:diabsuivi/app/shared/components/app_index.dart';
import 'dart:math';

import 'package:diabsuivi/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        //controller: controller,
        
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                    height: 400,
                    width: 400,
                    child:  Image.asset(
                      "assets/images/login1.jpg",
                      fit: BoxFit.fill,
                      
                    ) ,
                  ),
            ),   
             Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.hardEdge,
              children:[ 
                           
                  Container(
                width: 400,
                height: max(200, 200),
                
                decoration: const BoxDecoration(
                  color: Colors.white70,
                 // border: Border.all(color: Colors.black,width: 2.0,style:BorderStyle.solid), 
                  
                ),
               child: Column(
                children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:50 ,
                  width: 300, 
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:const BorderRadius.all(Radius.circular(20.0))
                  ),
                  child:  Center(
                    child: TextFormField(
                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                     
                       prefixIcon:Icon(Icons.email), 
                      hintText: "Enter your mail",
                      hintStyle:  TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                      border: InputBorder.none,                    
                    ),
                    style:const TextStyle(fontSize: 16,),                   
                  ).paddingOnly(left:10),
                  ),                
                ),                
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:50 ,
                  width: 300, 
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:const BorderRadius.all(Radius.circular(20.0))
                  ),
                  child:  Center(
                    child: TextFormField(
                    cursorColor: Colors.white,
                    decoration:const InputDecoration(
                      
                     // suffix: Icon(Icons.remove_red_eye),
                      prefixIcon:Icon(Icons.lock_outlined), 
                      hintText: "Enter your mail",
                      hintStyle:TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                      border: InputBorder.none,                    
                    ),
                    style:const  TextStyle(fontSize: 16,),                   
                  ).paddingOnly(left:10),
                  ),                
                )              
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:50,
                  width: 300,
                  
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextButton(onPressed:() {
                   Get.to(()=>HomeView());
                  }, child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),)
                  
                  ),
                  
                ),
              ),
                ],
                
               ),
                
                 ), 
                  
              ]
              
              ),
             
          ],
        ),
        
       
              
            
             ),
      
  
            // BoxShadow(
            //           color: Colors.greenAccent[200],
            //           offset: const Offset(
            //             5.0,
            //             5.0,
            //           ),
            //           blurRadius: 10.0,
            //           spreadRadius: 2.0,
            //         ), //BoxShadow
            //         BoxShadow(
            //           color: Colors.white,
            //           offset: const Offset(0.0, 0.0),
            //           blurRadius: 0.0,
            //           spreadRadius: 0.0,
            //         ), //BoxShadow
           
           
           
           
            
        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 25.0),
        //       child: Container(
        //         height: 300,
        //         width: 400,
        //         decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(100.0),
        //               bottomRight: Radius.circular(100.0)),
        //           // border: Border.all(
        //           // color: Colors.black,
        //           //width: 1,
        //         ),
        //         child: Image.asset(
        //           "assets/images/medecinlog.jpg",
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     Container(
        //       height: 30.0,
        //       width: 400.0,
        //       decoration: const BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(50.0),
        //               topRight: Radius.circular(50.0))),
        //       child: const Center(
        //           child: Text(
        //         "DIABES",
        //       )),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(12.0),
        //       child: const AppTextField(
        //         labelText: 'mail adress',
        //         hintText: 'Entrer votre adresse mail',
        //       ).paddingOnly(bottom: 10.0),
        //     ),
        //     const Padding(
        //       padding: EdgeInsets.all(12.0),
        //       child: AppTextField(
        //         labelText: 'Password',
        //         hintText: 'Entrer votre mot de passe',
        //         prefixIconData: Icons.lock_outlined,
        //         isPassword: true,
        //       ),
        //     ),
        //     Container(
        //       height: 50,
        //       width: 250,
        //       decoration: BoxDecoration(
        //           color: Colors.blue.shade300,
        //           borderRadius: BorderRadius.circular(50)),
        //       child: TextButton(
        //           onPressed: () {
        //             Get.to(() => HomeView());
        //           },
        //           child: const Text(
        //             "Connexion",
        //             style: TextStyle(color: Colors.white),
        //           )),
        //     ).marginOnly(top: 20, bottom: 10),
        //     Row(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               height: 40,
        //               width: 20,
        //               decoration: BoxDecoration(
        //                   //color: Colors.white,
        //                   borderRadius: BorderRadius.circular(50)),
        //               child: IconButton(
        //                   onPressed: () {},
        //                   icon: Image.asset("assets/images/facebook.png")),
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               height: 40,
        //               width: 20,
        //               decoration: BoxDecoration(
        //                   // color: Colors.white,
        //                   borderRadius: BorderRadius.circular(100)),
        //               child: IconButton(
        //                   onPressed: () {},
        //                   icon: Image.asset("assets/images/google.jpg")),
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //                 height: 40,
        //                 width: 20,
        //                 decoration: BoxDecoration(
        //                     //color: Colors.white,
        //                     borderRadius: BorderRadius.circular(100)),
        //                 child: IconButton(
        //                     onPressed: () {},
        //                     icon: Image.asset(
        //                       "assets/images/codeqr.jpg",
        //                     ))),
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
      //),
    );
  }
}
