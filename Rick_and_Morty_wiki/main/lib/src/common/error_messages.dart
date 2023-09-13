abstract class ErrorMessage {
  final String text;

  ErrorMessage({required this.text});
}

class NoConnect extends ErrorMessage {
  NoConnect() : super(text: 'No internet connection');
}
