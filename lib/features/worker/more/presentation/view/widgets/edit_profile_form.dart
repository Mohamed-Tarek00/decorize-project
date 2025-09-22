import 'package:decorize_project/features/worker/more/presentation/view/widgets/custom_profile_dropdown.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/custom_profile_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomProfileTextField(
            label: "الاسم",
            hint: "يوسف النجار",
            iconPath: 'assets/icons/person2.svg',
          ),
          const SizedBox(height: 12),
          CustomProfileTextField(
            label: "رقم الجوال",
            hint: "+966 25676461668",

            showEditButton: true,
            iconPath: 'assets/icons/call.svg',
          ),
          const SizedBox(height: 12),
          CustomProfileTextField(
            label: "كلمة المرور",
            hint: "***********",
            showEditButton: true,
            obscureText: true,
            iconPath: 'assets/icons/lock.svg',
          ),
          const SizedBox(height: 12),
          CustomProfileTextField(
            label: "رقم الهوية",
            hint: "ادخل رقم الهوية",
            iconPath: 'assets/icons/id.svg',
          ),
          const SizedBox(height: 12),
          CustomProfileDropdown(
            label: "الوظيفة *",
            hint: "اختر الوظيفة",
            items: const ["نجار", "كهربائي", "سباك"],
            iconPath: 'assets/icons/bag-timer.svg',
          ),
          const SizedBox(height: 12),
          CustomProfileDropdown(
            label: "المدينة *",
            hint: "اختر المدينة",
            items: const ["الرياض", "جدة", "الدمام"],
            iconPath: 'assets/icons/location.svg',
          ),
        ],
      ),
    );
  }
}
