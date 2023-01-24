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
}