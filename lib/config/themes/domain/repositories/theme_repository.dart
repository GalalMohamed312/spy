

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> changeTheme({required String themeMode});
  Future<Either<Failure, String>> getSavedTheme();
}
