public class FlightsService {
    private static final String ENDPOINT = 'https://flight-finder-api-044ch3.5sc6y6-2.usa-e2.cloudhub.io/flights';

    public static List<Flight> search(String destination) {
        List<Flight> flights = new List<Flight>();
        flights.addAll(searchFlights(destination.toUpperCase()));
        return flights;
    }

    public static Flight getByCode(String code) {
        return getFlightByCode(code);
    }    

    private static List<Flight> searchFlights(String destination) {
        List<Flight> flights = new List<Flight>();

        String endpoint = ENDPOINT;
        // add query parameter for searching by destination
        if (destination.length() == 3) {
            endpoint = endpoint + '?destination=' + destination;
        }

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
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

        String endpoint = ENDPOINT + '/' + code;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);

        if(response.getStatusCode() == 200) {
            flight = (Flight)JSON.deserialize(response.getBody(), Flight.class);
        }

        return flight;        
    }
}