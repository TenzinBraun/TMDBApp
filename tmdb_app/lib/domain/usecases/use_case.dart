/// Abstract class representing a use case with a return type [Type] and parameters [Params].
///
/// Implement this class to define specific use case logic.
///
/// See also
///  - [call], to call the use case function.
abstract class UseCase<Type, Params extends UseCaseParams> {
  /// Executes the use case with the provided parameters.
  /// - @params: A [params] of type [Params].
  /// - @return: A [Future] of type [Type].
  Future<Type> call(Params params);
}


abstract interface class UseCaseParams {}

/// Represent default empty Params for the use case.
class NoParams implements UseCaseParams {}
