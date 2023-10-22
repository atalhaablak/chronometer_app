abstract class Failure {
  String? errorMessage;

  Failure({this.errorMessage});
}

class BadRequestFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class ForbiddenFailure extends Failure {}

class NotFoundFailure extends Failure {}

class InternalFailure extends Failure {}

class GatewayTimeOutFailure extends Failure {}

class NotAuthenticateFailure extends Failure {}

class NullPointerFailure extends Failure {}

class ListEmptyFailure extends Failure {}

class ThisClassDoesNotImplemented extends Failure {}

class VerificationCodeNotMatchedFailure extends Failure {}

class NotificationNotSetFailure extends Failure {}

class NoteNotSaveLocalFailure extends Failure {}

class NoteNotSaveRemoteFailure extends Failure {}
