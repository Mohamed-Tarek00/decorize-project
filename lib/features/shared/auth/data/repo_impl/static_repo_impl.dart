import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/utils/handle_request.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class StaticRepoImpl implements StaticRepo {
  final StaticDataSource staticDataSource;

  StaticRepoImpl({required this.staticDataSource});
  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
   return await handleRequest(request: ()async{
 final governorates = await staticDataSource.getGovernorates(); 
 return governorates.map((gov)=> gov.toEntity()).toList() ;   } );
  }

  @override
  Future<Either<Failure, List<City>>> getCitiesByGovernorateId(
    int governorateId,
  ) async {
    return await handleRequest(request: ()async {
 final cities = await staticDataSource.getCitiesByGovernorateId(governorateId);
 return cities.map((city)=> city.toEntity()).toList() ;
    });  
  }

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    return await handleRequest(request: ()async {
 final jobs = await staticDataSource.getJobs();
  return jobs.map((job)=> job.toEntity()).toList() ;
      });
  }
}
