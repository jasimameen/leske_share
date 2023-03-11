import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final StackTrace? stackTrace;

  const Failure({
    this.message,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [message, stackTrace];
}
