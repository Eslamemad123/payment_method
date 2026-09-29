abstract class Falier {
  final String errorMessage;

  new({required this.errorMessage});
}
 class ServerFailer extends Falier{
  new({required super.errorMessage});

}
