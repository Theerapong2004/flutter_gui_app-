import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
  final emailController = TextEditingController();
  var isLoading = false.obs;

  // ฟังก์ชันส่งคำขอรีเซ็ตรหัสผ่าน
  Future<void> resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty || !email.contains("@")) {
      Get.snackbar("ผิดพลาด", "กรุณากรอกอีเมลให้ถูกต้อง");
      return;
    }

    isLoading.value = true;

    try {
      // จำลองการส่งอีเมลรีเซ็ตรหัสผ่าน (คุณอาจเชื่อม Firebase หรือ API จริงได้)
      await Future.delayed(const Duration(seconds: 2));

      // สำเร็จ
      Get.snackbar("ส่งสำเร็จ", "เราได้ส่งลิงก์รีเซ็ตรหัสผ่านไปยังอีเมลของคุณแล้ว");
      Get.back(); // กลับไปหน้าก่อนหน้า
    } catch (e) {
      Get.snackbar("เกิดข้อผิดพลาด", "$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
