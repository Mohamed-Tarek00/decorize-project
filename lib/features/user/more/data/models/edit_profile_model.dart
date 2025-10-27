import 'package:decorize_project/features/user/more/domain/entities/edit_profile_entity.dart';

class EditProfileModel extends EditProfileEntity {
  EditProfileModel({required super.name, required super.phone});

  factory EditProfileModel.fromEntity(EditProfileEntity entity) {
    return EditProfileModel(name: entity.name, phone: entity.phone);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'phone': phone};
  }
}
