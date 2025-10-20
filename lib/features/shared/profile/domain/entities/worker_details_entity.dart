class WorkerDetailsEntity {
  final int id;
  final String name;
  final String profession;
  final String image;
  final List<String> gallery;
  final Map<String, dynamic> rateDistribution;
  final double avgRate;
  final int ratesCount;
  final List<dynamic> rates;

  const WorkerDetailsEntity({
    required this.id,
    required this.name,
    required this.profession,
    required this.image,
    required this.gallery,
    required this.rateDistribution,
    required this.avgRate,
    required this.ratesCount,
    required this.rates,
  });
}
