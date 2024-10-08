import 'package:get/get.dart';
import 'package:todolist_app/app/modules/auth/register/bindings/register_binding.dart';
import 'package:todolist_app/app/modules/auth/register/views/register_view.dart';
import 'package:todolist_app/app/modules/auth/sign_in/bindings/sign_in_binding.dart';
import 'package:todolist_app/app/modules/auth/sign_in/views/sign_in_view.dart';
import 'package:todolist_app/app/modules/page/add_todo/bindings/add_todo_binding.dart';
import 'package:todolist_app/app/modules/page/add_todo/views/add_todo_view.dart';
import 'package:todolist_app/app/modules/page/home/bindings/home_binding.dart';
import 'package:todolist_app/app/modules/page/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SIGNIN;

  static final routes = [
    //auth
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),

    //page
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TODO,
      page: () => const AddTodoView(),
      binding: AddTodoBinding(),
    ),
  ];
}
