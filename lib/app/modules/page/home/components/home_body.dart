import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/app/modules/page/home/controllers/home_controller.dart';
import 'package:todolist_app/app/routes/app_pages.dart';
import 'package:todolist_app/app/utils/utils_color_resources.dart';
import 'package:todolist_app/app/utils/utils_dimensions.dart';
import 'package:todolist_app/app/utils/utils_text_style.dart';
import 'package:todolist_app/app/widgets/main_container.dart';
import 'package:todolist_app/app/widgets/main_dialog.dart';
import 'package:todolist_app/app/widgets/main_primary_button.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.ceklist();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(UtilsDimensions.paddingSizeSmall),
                itemCount: controller.item.length,
                itemBuilder: (context, index) {
                  final item = controller.item[index];

                  return MainContainer(
                    padding: const EdgeInsets.all(
                        UtilsDimensions.paddingSizeDefault),
                    color: UtilsColorResources.primaryColor,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name ?? '-',
                          style: UtilsTextStyle.textDefault
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 46,
                          width: 46,
                          child: IconButton(
                            onPressed: () => Get.dialog(
                              MainDialog(
                                content: Column(
                                  children: [
                                    Text('Hapus Todo'.tr,
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                cancel: () => Get.back(),
                                confirm: () {
                                  Get.back();
                                  controller.deleteCeklist(item.id);
                                },
                                textConfirm: 'ya'.tr,
                                textCancel: 'batal'.tr,
                              ),
                            ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: UtilsDimensions.paddingSizeSmall,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
          MainPrimaryButton(
            title: 'Tambah',
            press: () => Get.toNamed(Routes.ADD_TODO),
          ),
          const SizedBox(
            height: UtilsDimensions.paddingSizeDefault,
          ),
        ],
      ),
    );
  }
}
