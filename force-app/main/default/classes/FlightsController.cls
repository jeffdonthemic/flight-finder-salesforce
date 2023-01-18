public class FlightsController {

    @AuraEnabled
    public static List<Flight> search(String destination) {
        List<Flight> flights = new List<Flight>();

        flights.addAll(deltaFlights(destination.toUpperCase()));
        flights.addAll(unitedFlights(destination.toUpperCase()));

        return flights;
    }

    @AuraEnabled
    public static Flight getByCode(String code) {
        if (code.startsWith('U')) {
            return getUnitedByCode(code);
        } else {
            return getDeltaByCode(code);
        }
    }    

    // REST service
    private static Flight getUnitedByCode(String code) {
        Flight flight = new Flight();
        flight.code = code;
        flight.airlineName = 'United';

        String endpoint = 'https://flight-finder-united.herokuapp.com/flights/' + code;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);

        if(response.getStatusCode() == 200) {
            Map<String, Object> flightMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            flight.flightNumber = (String)flightMap.get('flightNumber');
            flight.destination = (String)flightMap.get('destination');
            flight.origin = (String)flightMap.get('code');
            flight.departureDate = (String)flightMap.get('date');
            flight.price = (Double)flightMap.get('amount');
            flight.planeType = (String)flightMap.get('code');
            flight.emptySeats = (Integer)flightMap.get('seatsAvailable');
        }        

        return flight;        
    }

    // REST service
    private static List<Flight> unitedFlights(String destination) {
        List<Flight> flights = new List<Flight>();

        String endpoint = 'https://flight-finder-united.herokuapp.com/flights';
        // add query parameter for searching by destination
        if (destination.length() == 3) {
            endpoint = endpoint + '?destination=' + destination;
        }

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);

        if(response.getStatusCode() == 200) {
            List<Object> flightObjects = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object f : flightObjects) {
                // each element is a map of keys
                Map<String, Object> flightMap = (Map<String, Object>)f;
                Flight flight = new Flight();
                flight.code = (String)flightMap.get('code');
                flight.airlineName = (String)flightMap.get('airlineName');
                flight.flightNumber = (String)flightMap.get('flightNumber');
                flight.destination = (String)flightMap.get('destination');
                flight.origin = (String)flightMap.get('code');
                flight.departureDate = (String)flightMap.get('date');
                flight.price = (Double)flightMap.get('amount');
                flight.planeType = (String)flightMap.get('code');
                flight.emptySeats = (Integer)flightMap.get('seatsAvailable');
                // add flight to the collection
                flights.add(flight);
            }
        }     

        return flights;
    }

    // SOAP service
    private static Flight getDeltaByCode(String code) {
        Flight flight = new Flight();

        for (Flight f : deltaFlights('')) {
            if (code == f.code) {
                flight = f;
                break;
            }
        }

        return flight;
    }
    
    // SOAP service
    private static List<Flight> deltaFlights(String destination) {
        List<Flight> flights = new List<Flight>();

        DeltaAirlinesService.TicketServicePort delta = new  DeltaAirlinesService.TicketServicePort();
        DeltaAirlinesService.flight[] results;

        if (destination == '') {
            results = delta.listAllFlights();
        } else if (destination.length() == 3) {
            results = delta.findFlight(destination);
        }

        if (results != null) {
            for (DeltaAirlinesService.Flight flight : results) {
                flights.add(new Flight(flight));
            }
        }
        
        return flights;
    }      
}