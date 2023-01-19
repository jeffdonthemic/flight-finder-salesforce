public class FlightsController {

    @AuraEnabled
    public static List<Flight> search(String destination) {
        return FlightsService.search(destination);
    }

    @AuraEnabled
    public static Flight getByCode(String code) {
        return FlightsService.getByCode(code);
    }      
}