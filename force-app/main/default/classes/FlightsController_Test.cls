@isTest
public class FlightsController_Test {

    @IsTest
    static void search(){
        Test.setMock(HTTPCalloutMock.class, new FlightFinderCalloutMock()); 

        Test.startTest();
        List<Flight> flights = FlightsController.search('');
        Test.stopTest();
        
        System.assertEquals(11, flights.size(), 'Wrong number of results');
    }    

    @IsTest
    static void getByCode(){
        Test.setMock(HTTPCalloutMock.class, new FlightFinderCalloutMock()); 
        
        Test.startTest();
        Flight flight = FlightsController.getByCode('U1100');
        Test.stopTest();
        
        System.assertEquals('U1100', flight.code, 'Wrong code');
    }
}