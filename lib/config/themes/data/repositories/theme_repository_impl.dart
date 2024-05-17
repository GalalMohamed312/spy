import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_data_source.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource themeLocalDataSource;

  ThemeRepositoryImpl({required this.themeLocalDataSource});

  @override
  Future<Either<Failure, bool>> changeTheme({required String themeMode}) async{
    try {
      final themeIsChanged =
          await themeLocalDataSource.changeTheme(themeMode: themeMode);
      debugPrint("theme changed=$themeIsChanged");
      return Right(themeIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedTheme() async{
    try {
      final themeCode = await themeLocalDataSource.getSavedTheme();
      return Right(themeCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
