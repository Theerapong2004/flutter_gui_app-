import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisController extends GetxController {
  // ตัวแปรควบคุม TextField
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // แสดง/ซ่อนรหัสผ่าน
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  // สถานะโหลด
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  // ฟังก์ชันสมัครสมาชิก
  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // ตรวจสอบข้อมูลเบื้องต้น
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("ผิดพลาด", "กรุณากรอกข้อมูลให้ครบถ้วน");
      return;
    }

    if (password.length < 6) {
      Get.snackbar("รหัสผ่านสั้นเกินไป", "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("รหัสผ่านไม่ตรงกัน", "โปรดตรวจสอบรหัสผ่านอีกครั้ง");
      return;
    }

    isLoading.value = true;

    try {
      // จำลองการสมัครสมาชิก
      await Future.delayed(const Duration(seconds: 2));

      // หากสำเร็จ
      Get.snackbar("สำเร็จ", "สมัครสมาชิกเรียบร้อย");
      Get.offAllNamed("/login"); // ย้ายไปหน้า Login
    } catch (e) {
      Get.snackbar("เกิดข้อผิดพลาด", "$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
