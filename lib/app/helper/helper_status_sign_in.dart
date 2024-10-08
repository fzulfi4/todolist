import 'package:todolist_app/app/helper/helper_client.dart';
import 'package:todolist_app/app/helper/helper_local_storages.dart';

class HelperStatusSignIn {
  // Alternatif untuk pengecekan status yang state responsive
  // bisa menggunakan `ProfileController.isSignedId`.
  bool isSignIn() =>
      HelperClient.box.read(HelperLocalStorages.isSignIn) ?? false;
}
