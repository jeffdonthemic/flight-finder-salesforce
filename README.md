# Salesforce API Transformation to MuleSoft

This is the code for the my 3 part series on [Salesforce Developers codeLive Youtube channel](https://www.youtube.com/@SalesforceDevs): Revamp & Power Up - Salesforce API Transformation to MuleSoft

The scenario for the demo is that your Salesforce org has an existing application to search for Delta and United flights. It consists of a simple Lighting Web Component, a controller and a service class that makes callouts to a Delta SOAP service and a United REST service.

Your new boss loves the service but wants you to make a number of enhancements:

- It needs to be easily discoverable by IT and other developers within your organization.
- She wants to use the service on the company website and by mobile applications so it needs to be easily accessible, consumable and reusable by IT and other developers.
- Since it will be used by other applications you’ll need to implement centralized governance and compliance.
- You’ll need to implement SLAs with monitoring, security and scalability.
- It will need to be extensible for future enhancements, including a current request to add a PostgreSQL DB for American Airlines.

To meet these requirements, your approach is to create an API on MuleSoft Anypoint Platform and move the callouts from the Apex class and this API implementation.

## Part #1

Video: [Revamp & Power Up - Salesforce API Transformation to MuleSoft with Jeff Douglas - Part 1](https://www.jeffdouglas.com/part-1-salesforce-api-transformatin-to-mulesoft)

Agenda for Part #1:

- Examine the existing Salesforce code
- Define the API with RAML, the Restful API Modeling Language
- Mock the API to test its design before building
- Make the API discoverable by adding it to the private Anypoint Exchange

## Part #2

Video: [Revamp & Power Up - Salesforce API Transformation to MuleSoft with Jeff Douglas - Part 2](https://www.jeffdouglas.com/part-2-salesforce-api-transformatin-to-mulesoft)

Agenda for Part #2:

- Develop the implementation with Anypoint Studio
- Create a new MuleSoft application
- Connect to the three airline datasources using SOAP, REST and Database connectors
- Deploy the application to Anypoint Platform

## Part #3

Video: [Revamp & Power Up - Salesforce API Transformation to MuleSoft with Jeff Douglas - Part 3](https://www.jeffdouglas.com/part-3-salesforce-api-transformatin-to-mulesoft)

Agenda for Part #3:

- Refacter the Apex code to make a single callout to the new API on CloudHub.
- Create a Permission Set, External Credential and Named Credential for the Apex Callout.
- Create a screen flow that allows users to look up a flight by code using an HTTP Callout action.


# MuleSoft Anypoint Platform

The API's implementation was built using Anypoint Studio. You can [download](https://github.com/jeffdonthemic/flight-finder-salesforce/blob/main/flight-finder-api-spec.zip) the jar for the project and import it into Anypoint Studio.

## API Specification

You can [download](https://github.com/jeffdonthemic/flight-finder-salesforce/blob/main/codelive-flight-finder-api.jar) the API Specification with all assets.

```
#%RAML 1.0
title: Flight Finder API

types:
  Flight: !include types/flightType.raml

/flights:
  get:
    queryParameters:
      destination:
        required: false
    responses:
      200:
        body:
          application/json:
            type: Flight[]
            example:
              !include examples/getFlights.raml

  /{code}:
    get:
      responses:
        200:
          body:
            application/json:
              type: Flight[]
              example:
                !include examples/getFlights.raml
              
```


