import 'dart:developer';

import 'package:diabsuivi/app/data/models/dossier.dart';
import 'package:diabsuivi/app/routes/app_pages.dart';
import 'package:diabsuivi/app/services/http/http_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin  {
  String scannedQrcode = '';
   String? id;
  

final count = 0.obs;
  var qrcode = 'Unknown'.obs;
  Future<void>scannerQrCode() async{
    try {
      final qrCode=await FlutterBarcodeScanner.scanBarcode(
       '#ff6666',
      'cancel',
         true, 
          ScanMode.QR);
       this.qrcode.value=qrCode;
      if(qrCode!=''){
        log(qrCode.toString());
       fetchDossier(qrCode);
      
      }else{
        Get.snackbar('User', 'votre document n\'est pas reconu');
     }
    } on PlatformException{
      qrcode.value='failled to get plateforme version';
    }
  }
  
  
  
  
  
   fetchDossier(dynamic qrcode) async {
    try {
      await HttpService.request(
        HttpMethod.get,
        baseUrl: Api.baseUrlVersion,
        '${Api.getDossier}/$qrcode',
      ).then((response) {
        if (response != null) {
         
          var data = Dossier.fromJson(response);
            Get.toNamed(Routes.CONTROLLE,arguments:data);
          log(response);
          
          saveid();
        }
      });//.catchError(e);
    
   
    } catch(e){
   
    }finally {}
    
    
  }
  
  void saveid() {
    HttpService.request(
      HttpMethod.post,
      Api.postDossier ,
      baseUrl: Api.apiVersion,
      payload: {
        'id':id,   
      },
    );//.catchError(onErrorToast);
  }

//final count = 0.obs;
  //@override
//   var qrcode = 'Unknown'.obs;
//   Future<void>scannerQrCode() async{
//     try {
//       final qrCode=await FlutterBarcodeScanner.scanBarcode(
//        '#ff6666',
//       'cancel',
//          true, 
//           ScanMode.QR);
//        this.qrcode.value=qrCode;
//       // if(qrCode){
//         Get.to(() => ControlleView(),arguments: qrcode);
//         //log(qrcode);
//       // }else{
//         // Get.to( HomeView(),arguments: qrCode);
//        // Get.snackbar('User', 'votre document n\'est pas reconu');
//      //  }
//     } on PlatformException{
//       qrcode.value='failled to get plateforme version';
//     }
//   }
  
//   Dio dio=Dio(BaseOptions(baseUrl: Api.baseUrlVersion, contentType: "application/json"));
//  Dossier ?dossierModel;
//   var load=true.obs;
//     fetchSiglePaiement() async {
//       try {
//         load.value=true;
//         //dio.interceptors.add(PrettyDioLogger());
//         var rep = await dio.get("${Api.getDossier}/${Get.arguments}");
//         if (rep.statusCode==200) {
//           dossierModel=Dossier.fromJson(rep.data);
//           load.value=false;
//         }
        
//       } catch (e) {
//         load.value=false;
//         log(e.toString());
//       }
//     }
  
  @override
  void onInit() {
    super.onInit();
   // scannerQrCode();
  // fetchSiglePaiement();

    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void increment() => count.value++;
  }
  
  
   
  
  
  
 
  
  // var qrcode = 'Unknown'.obs;
  // Future<void>scannerQrCode() async{
  //   try {
  //     final qrCode=await FlutterBarcodeScanner.scanBarcode(
  //     '#ff6666',
  //     'cancel',
  //        true, 
  //       ScanMode.QR);
  //      this.qrcode.value=qrCode;
  //      if(qrCode==true){
  //       Get.to(ControlleView(),arguments:qrCode);
  //     //log(qrCode);
  //       }else{
  //        Get.snackbar('User', 'error link');
  //      }
  //   } on PlatformException{
  //     qrcode.value='failled to get plateforme version';
  //   }
  // }
  
  
  
  

        
  //  fetchSiglePaiement(dynamic id) async {
  
  //     change(null, status: RxStatus.loading());
  //     await HttpService.request(
  //       HttpMethod.get,
  //       baseUrl: Api.host,
  //       '${Api.getInfos}/$id',
  //     ).then((response) {
  //       if (response != null) {
  //         var data =  ClientModel.fromJson(response);
  //         print(data);
  //         //Get.toNamed(Routes.HOME, arguments: data)!.then((value) {
  //         //   if (value != null) {
  //         //     Get.back(result: value);
  //         //   }
  //         // });
  //       }
  //     }).catchError((error){
  //        String message = 'Error occured';
  //     if (error is BaseException) {
  //       message = error.message!;
  //     }
  //     change(null, status: RxStatus.error(message));
  //     });
  //   }

    
