import 'package:get/get.dart';
//with StateMixin

class ControlleController extends GetxController  {
  
    
    
 
 //Dossier? dossier;
 // var load=true.obs;
final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
  
 




//  Dio dio=Dio(BaseOptions(baseUrl: Api.host, contentType: "application/json"));
//  ClientModel? clientModel;
//   var load=true.obs;
//     fetchSiglePaiement() async {
//       try {
//         load.value=true;
//         dio.interceptors.add(PrettyDioLogger());
//         var rep = await dio.get("${Api.getInfos}/${Get.arguments}");
//         if (rep.statusCode==200) {
//           clientModel=ClientModel.fromJson(rep.data);
//           load.value=false;
         
//         }else{
          
//         }       
//       } catch (e) {
//         load.value=false;
//         log(e.toString());
//         // if (e==BaseOptions(
          
//         // )
//         // ) {
          
//         // }
//       }}
}

