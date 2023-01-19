@isTest
global class UnitedFlightByCodeCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"code":"U1100","airlineName":"United","flightNumber":"U1100","amount":400,"destination":"SFO","origin":"PDX","date":"2023/03/20","planeType":"Boeing 737","seatsAvailable":1}');
        response.setStatusCode(200);
        return response; 
    }
}