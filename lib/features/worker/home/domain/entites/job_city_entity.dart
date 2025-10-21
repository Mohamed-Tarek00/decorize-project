class JobCityEntity {
  final int id;
  final String name;
  final JobMultiName? multiName;

  JobCityEntity({required this.id, required this.name, this.multiName});
}

class JobMultiName {
  final String? ar;
  final String? en;

  JobMultiName({this.ar, this.en});
}
