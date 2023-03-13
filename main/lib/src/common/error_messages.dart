abstract class ErrorMessage {
  final String text;

  ErrorMessage({required this.text});
}

class NoConnect extends ErrorMessage {
  NoConnect() : super(text: 'No internet connection');
}

class SeveredConnection extends ErrorMessage {
  SeveredConnection() : super(text: 'The connection was severed');
}
