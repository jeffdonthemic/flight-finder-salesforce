@isTest
global class DeltaFlightsCalloutMock implements WebServiceMock {
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

        DeltaAirlinesService.listAllFlightsResponse response_x = new DeltaAirlinesService.listAllFlightsResponse();

        List<DeltaAirlinesService.flight> flights = new List<DeltaAirlinesService.flight>(); 

        DeltaAirlinesService.flight f1 = new DeltaAirlinesService.flight();
        f1.code = 'A1B2C3';
        DeltaAirlinesService.flight f2 = new DeltaAirlinesService.flight();
        f2.code = 'A1B2C4';

        flights.add(f1);
        flights.add(f2);

        response_x.return_x = flights;
        response.put('response_x', response_x);                    
   }
}