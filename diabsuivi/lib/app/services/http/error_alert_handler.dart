import 'package:diabsuivi/app/services/http/http_exeptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorAlertHandler {
  onErrorDialog(error) {
    if (error is BaseException) {
      Get.dialog(AlertDialog(
        title: Text('${error.title}'),
        content: Text('${error.message}'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Fermer'),
          ),
        ],
      ));
    }
  }

  onErrorToast(error) {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    if (error is BaseException) {
      IconData icon = Icons.warning_amber_rounded;

      switch (error.runtimeType) {
        case ConnectivityException:
          icon = Icons.wifi;
          break;
        case ValidationErrorException:
          icon = Icons.add_moderator;
          break;
        case ServerErrorException:
          icon = Icons.electrical_services_rounded;
          break;
        default:
      }

      Get.snackbar('${error.title}', '${error.message}',
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      // log(error.toString());
    }
  }
}
