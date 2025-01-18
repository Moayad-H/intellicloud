import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intellicloud/app_repository.dart/repository.dart';

void failureHandler(
    Either<Failure, dynamic> result, void Function() onSuccess) {
  result.fold(
    (l) => log(l.message),
    (r) => onSuccess(),
  );
}
