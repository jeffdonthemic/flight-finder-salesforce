@isTest
global class UnitedFlightsByDestinationCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"code":"U1100","airlineName":"United","flightNumber":"U1100","amount":400,"destination":"SFO","origin":"PDX","date":"2023/03/20","planeType":"Boeing 737","seatsAvailable":1},{"code":"U1730","airlineName":"United","flightNumber":"U1730","amount":525,"destination":"SFO","origin":"PDX","date":"2023/03/19","planeType":"Boeing 707","seatsAvailable":11},{"code":"U1282","airlineName":"United","flightNumber":"U1282","amount":650,"destination":"SFO","origin":"PDX","date":"2023/03/11","planeType":"Boeing 777","seatsAvailable":24}]');
        response.setStatusCode(200);
        return response; 
    }
}