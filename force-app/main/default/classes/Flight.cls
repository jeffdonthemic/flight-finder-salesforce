public with sharing class Flight {
    @AuraEnabled public String code;
    @AuraEnabled public String airlineName;
    @AuraEnabled public String flightNumber;
    @AuraEnabled public String destination;
    @AuraEnabled public String origin;
    @AuraEnabled public String departureDate;
    @AuraEnabled public Double price;
    @AuraEnabled public String planeType;
    @AuraEnabled public Integer emptySeats;

    public Flight() {}

    public Flight(DeltaAirlinesService.Flight flight) {
        this.code = flight.code;
        this.airlineName = flight.airlineName;
        this.flightNumber = 'D' + flight.code;
        this.destination = flight.destination;
        this.origin = flight.origin;
        this.departureDate = flight.departureDate;
        this.price = flight.price;
        this.planeType = flight.planeType;
        this.emptySeats = flight.emptySeats;
    }
}