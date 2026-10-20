abstract class Falier {
  final String errorMessage;

  new({required this.errorMessage});
}

class ServerFailer extends Falier {
  new({required super.errorMessage});
}

class CancelledFailer extends Falier {
  new({super.errorMessage = 'Payment cancelled by user'});
}

class PendingFailer extends Falier {
  new({super.errorMessage = 'Payment is pending confirmation'});
}
