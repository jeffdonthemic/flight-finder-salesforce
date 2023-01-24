@isTest
public class FlightsService_Test {

    @IsTest
    static void search(){
        Test.setMock(HTTPCalloutMock.class, new FlightFinderCalloutMock()); 

        Test.startTest();
        List<Flight> flights = FlightsService.search('');
        Test.stopTest();
        
        System.assertEquals(11, flights.size(), 'Wrong number of results');
    }        

    @IsTest
    static void searchByDestination(){
        Test.setMock(HTTPCalloutMock.class, new FlightFinderCalloutMock()); 

        Test.startTest();
        List<Flight> flights = FlightsService.search('LAX');
        Test.stopTest();
        
        for (Flight flight : flights) {
            System.assertEquals('LAX', flight.destination, 'Wrong destination');
        }
        System.assertEquals(10, flights.size(), 'Wrong size');
    }     

    @IsTest
    static void getFlightByCode(){
        Test.setMock(HTTPCalloutMock.class, new FlightFinderCalloutMock()); 

        Test.startTest();
        Flight flight = FlightsService.getByCode('U1100');
        Test.stopTest();
        
        System.assertEquals('U1100', flight.code, 'Wrong code');
    }                          
}