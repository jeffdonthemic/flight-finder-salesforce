@isTest
global class DeltaFlightsByDestinationCalloutMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {

        DeltaAirlinesService.findFlightResponse response_x = new DeltaAirlinesService.findFlightResponse();

        List<DeltaAirlinesService.flight> flights = new List<DeltaAirlinesService.flight>(); 

        DeltaAirlinesService.flight f1 = new DeltaAirlinesService.flight();
        f1.code = 'A1B2C3';
        f1.destination = 'SFO';
        DeltaAirlinesService.flight f2 = new DeltaAirlinesService.flight();
        f2.code = 'A1B2C4';
        f2.destination = 'SFO';

        flights.add(f1);
        flights.add(f2);

        response_x.return_x = flights;
        response.put('response_x', response_x);                    
   }
}