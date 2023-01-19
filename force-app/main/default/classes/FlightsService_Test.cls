@isTest
public class FlightsService_Test {

    @IsTest
    static void search(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightsCalloutMock()); 

        Test.startTest();
        List<Flight> flights = FlightsService.search('');
        Test.stopTest();
        
        System.assertEquals(4, flights.size(), 'Wrong number of results');
    }        

    @IsTest
    static void getByCodeDelta(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());

        Test.startTest();
        Flight flight = FlightsService.getByCode('A1B2C4');
        Test.stopTest();
        
        System.assertEquals('A1B2C4', flight.code, 'Wrong code');
    }

    @IsTest
    static void getByCodeUnited(){
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightByCodeCalloutMock());   

        Test.startTest();
        Flight flight = FlightsService.getByCode('U1100');
        Test.stopTest();
        
        System.assertEquals('U1100', flight.code, 'Wrong code');
    }       

    @IsTest
    static void unitedFlights(){
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightsCalloutMock());   

        Test.startTest();
        List<Flight> flights = FlightsService.unitedFlights('');
        Test.stopTest();
        
        System.assertEquals(2, flights.size(), 'Wrong size');
    }

    @IsTest
    static void unitedFlightsByDesination(){
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightsByDestinationCalloutMock());      

        Test.startTest();
        List<Flight> flights = FlightsService.unitedFlights('sfo');
        Test.stopTest();
        
        for (Flight flight : flights) {
            System.assertEquals('SFO', flight.destination, 'Wrong destination');
        }
        System.assertEquals(3, flights.size(), 'Wrong size');
    }    

    @IsTest
    static void unitedFlightByCode(){
        Test.setMock(HTTPCalloutMock.class, new UnitedFlightByCodeCalloutMock());    

        Test.startTest();
        Flight flight = FlightsService.getUnitedByCode('U1100');
        Test.stopTest();
        
        System.assertEquals('U1100', flight.code, 'Wrong code');
    }        

    @IsTest
    static void deltaFlights(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());

        Test.startTest();
        List<Flight> flights = FlightsService.deltaFlights('');
        Test.stopTest();
        
        System.assertEquals(2, flights.size(), 'Wrong size');
    }    

    @IsTest
    static void deltaFlightsByDesination(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsByDestinationCalloutMock());  

        Test.startTest();
        List<Flight> flights = FlightsService.deltaFlights('sfo');
        Test.stopTest();
        
        for (Flight flight : flights) {
            System.assertEquals('SFO', flight.destination, 'Wrong destination');
        }        
        System.assertEquals(2, flights.size(), 'Wrong size');
    }

    @IsTest
    static void deltaFlightByCode(){
        Test.setMock(WebServiceMock.class, new DeltaFlightsCalloutMock());

        Test.startTest();
        Flight flight = FlightsService.getDeltaByCode('A1B2C4');
        Test.stopTest();
        
        System.assertEquals('A1B2C4', flight.code, 'Wrong code');
    }                
}