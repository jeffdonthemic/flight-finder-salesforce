public class FlightsService {

    public static List<Flight> search(String destination) {
        List<Flight> flights = new List<Flight>();
        flights.addAll(searchFlights(destination.toUpperCase()));
        return flights;
    }

    public static Flight getByCode(String code) {
        return getFlightByCode(code);
    }    

    // PRIVATE METHODS
    private static List<Flight> searchFlights(String destination) {
        List<Flight> flights = new List<Flight>();

        String queryParam = '';
        // add query parameter for searching by destination
        if (destination.length() == 3) {
            queryParam = '?destination=' + destination;
        }

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Flight_Finder_API/flights' + queryParam);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);

        if(response.getStatusCode() == 200) {
            flights = (List<Flight>)JSON.deserialize(response.getBody(), List<Flight>.class);
        }     

        return flights;
    }

    private static Flight getFlightByCode(String code) {
        Flight flight = new Flight();
        flight.code = code;

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Flight_Finder_API/flights/' + code);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);

        if(response.getStatusCode() == 200) {
            flight = (Flight)JSON.deserialize(response.getBody(), Flight.class);
        }

        return flight;        
    }
}