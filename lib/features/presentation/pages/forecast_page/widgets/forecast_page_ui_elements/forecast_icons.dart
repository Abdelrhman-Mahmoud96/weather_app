String getForecastIconsAsset(int iconNumber) {
  switch (iconNumber) {
    case 1:
      return 'assets/forecast_icons/1.png';
    case 2:
      return 'assets/forecast_icons/2.png';
    case 3:
      return 'assets/forecast_icons/3.png';
    case 4:
      return 'assets/forecast_icons/4.png';
    case 5:
      return 'assets/forecast_icons/5.png';
    case 6:
      return 'assets/forecast_icons/6.png';
    case 7:
      return 'assets/forecast_icons/7.png';
    case 8:
      return 'assets/forecast_icons/8.png';
    case 11:
      return 'assets/forecast_icons/11.png';
    case 12:
      return 'assets/forecast_icons/12.png';
    case 13:
      return 'assets/forecast_icons/13.png';
    case 14:
      return 'assets/forecast_icons/14.png';
    case 15:
      return 'assets/forecast_icons/15.png';
    case 16:
      return 'assets/forecast_icons/16.png';
    case 17:
      return 'assets/forecast_icons/17.png';
    case 18:
      return 'assets/forecast_icons/18.png';
    case 19:
      return 'assets/forecast_icons/19.png';
    case 20:
      return 'assets/forecast_icons/20.png';
    case 21:
      return 'assets/forecast_icons/21.png';
    case 22:
      return 'assets/forecast_icons/22.png';
    case 23:
      return 'assets/forecast_icons/23.png';
    case 24:
      return 'assets/forecast_icons/24.png';
    case 25:
      return 'assets/forecast_icons/25.png';
    case 26:
      return 'assets/forecast_icons/26.png';
    case 29:
      return 'assets/forecast_icons/29.png';
    case 30:
      return 'assets/forecast_icons/30.png';
    case 31:
      return 'assets/forecast_icons/31.png';
    case 32:
      return 'assets/forecast_icons/32.png';
    case 33:
      return 'assets/forecast_icons/33.png';
    case 34:
      return 'assets/forecast_icons/34.png';
    case 35:
      return 'assets/forecast_icons/35.png';
    case 36:
      return 'assets/forecast_icons/36.png';
    case 37:
      return 'assets/forecast_icons/37.png';
    case 38:
      return 'assets/forecast_icons/38.png';
    case 39:
      return 'assets/forecast_icons/39.png';
    case 40:
      return 'assets/forecast_icons/40.png';
    case 41:
      return 'assets/forecast_icons/41.png';
    case 42:
      return 'assets/forecast_icons/42.png';
    case 43:
      return 'assets/forecast_icons/43.png';
    case 44:
      return 'assets/forecast_icons/44.png';

    default:
      throw ArgumentError.value(
        iconNumber,
        'UNKNOWN ICON NUMBER HAS BEEN USED',
      );
  }
}
