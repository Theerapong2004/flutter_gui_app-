import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // ใช้สำหรับรับค่าจาก TextField
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ใช้สำหรับแสดง/ซ่อนรหัสผ่าน
  var isPasswordHidden = true.obs;

  // สถานะโหลด (กำลังล็อกอิน)
  var isLoading = false.obs;

  // ฟังก์ชันเปลี่ยนสถานะแสดงรหัสผ่าน
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // ฟังก์ชันล็อกอิน
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    // เช็คข้อมูลเบื้องต้น
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("เกิดข้อผิดพลาด", "กรุณากรอกอีเมลและรหัสผ่าน");
      return;
    }

    isLoading.value = true;

    try {
      // ตัวอย่าง: เช็ค email/password ตรงกันแบบ mock
      await Future.delayed(const Duration(seconds: 2)); // จำลองดีเลย์จาก server

      if (email == "test@example.com" && password == "123456") {
        Get.snackbar("สำเร็จ", "เข้าสู่ระบบสำเร็จ");
        // นำทางไปหน้าหลัก
        Get.offAllNamed("/home");
      } else {
        Get.snackbar("ไม่สำเร็จ", "อีเมลหรือรหัสผ่านไม่ถูกต้อง");
      }
    } catch (e) {
      Get.snackbar("ข้อผิดพลาด", "เกิดข้อผิดพลาด: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
