abstract class ErrorMessage {}

class NoConnect extends ErrorMessage {
  String noConnect = 'no internet connection';

  getNoConnectMessage() {
    return noConnect;
  }
}
