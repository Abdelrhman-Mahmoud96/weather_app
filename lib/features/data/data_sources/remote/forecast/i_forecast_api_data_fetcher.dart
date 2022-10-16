abstract class IForecastApiDataFetcher<ForecastData> {
  Future<ForecastData> getForecastDataFromApi(String locationId);  
}