@isTest
public class FlightsController_Test {

    @IsTest
    static void search(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightsCalloutMock()); 

        Test.startTest();
        List<Flight> flights = FlightsController.search('');
        Test.stopTest();
        
        System.assertEquals(4, flights.size(), 'Wrong number of results');
    }    

    @IsTest
    static void getByCode(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());
        
        Test.startTest();
        Flight flight = FlightsController.getByCode('A1B2C4');
        Test.stopTest();
        
        System.assertEquals('A1B2C4', flight.code, 'Wrong code');
    }
}