import { LightningElement, track } from 'lwc';
import search from '@salesforce/apex/FlightsController.search';
import getByCode from '@salesforce/apex/FlightsController.getByCode';

export default class FlightFinder extends LightningElement {
    destination = '';
    @track flights;
    @track flight;

    handleDestinationChange(event){
        this.destination = event.target.value;
    }

    executeGetByCode(event) {
        let code = event.target.id.split("-")[0];

        getByCode({code: code})
        .then(result => {
            this.flight = result;
            console.log(result);
        })
        .catch(error => {
            this.flight = null;
            console.log(error);
        });

    }

    executeFlightSearch() {
        search({destination: this.destination})
        .then(result => {
            this.flights = result;
        })
        .catch(error => {
            this.flights = null;
            console.log(error);
        });
    }
}