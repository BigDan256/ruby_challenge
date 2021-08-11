Create new endpoint to instigate customer order fulfilment
==========================================================

User Story
----------

As a warehouse officer 
I want to be able to initiate an order run
So that I can deliver orders according to my pending orders and inventory availability

Background
----------

New Order Management System Services (NOMSS) has been created to manage our customer orders and order fulfilment processes to replace our legacy system. Your task is quite simple, create the api specified in this ticket and show us how you would normally approach a task like this. 

Although we're not looking for an all-encompassing solution, covering every edge case you might encounter, we do expect you to treat it with the same care you would with any work you would normally do. Although we've only specified a single endpoint in this ticket, feel free to create any others in order to help test your work. 

Along with this document you would've received a sample data file called data.json. It contains three products and four orders, feel free to use this file as you see fit, but don't modify it. Each time your sample application runs it should read from the unmodified file.

Requirement
-----------

New Order Management System Services requires the endpoint POST api/v1/warehouse/fulfilment to be created. 

It will accept an array of Order IDs to process orders for fulfilment and shipping. 

If an order cannot be fulfilled due to low stock levels, it will return an array of order ids unfulfillable and not process the Order Fulfilment. 

If the stock quantity falls below the re-order threshold a new purchase order should be generated. For the purposes of this exercise assume that an endpoint for this service already exists, although you may have to stub something out to get things working. As long as you can verify that a purchase order has been created when stock levels fall to low, that's all that's required.

Fulfilment endpoint implementation: 

Sample Input
```
POST api/v1/warehouse/fulfilment
body
{
    "orderIds" : [1122,1123,1124,1125]
}
```

Expected Output
```
Orders that are unfulfillable: 
{
    "unfulfillable": [1123,1125]
} 
```

Acceptance Criteria
-------------------

New endpoint POST /warehouse/fulfilment accepts array of order IDs. 

Stock quantities will be checked to determine if it is possible to fulfil orders, updating the stock quantities upon allocation for order fulfilment and generating purchase orders where the resultant stock quantity is below the stock reorder threshold. 

Since this is just a simple example when an order is fulfilled you only need to decrease the stock on hand and change the order status to Fulfilled.

If an order cannot be fulfilled the order is changed to status "Error: Unfulfillable" to be flagged for review but other orders within the order run are processed. 

Out of scope
------------

This ticket does not address consignment labelling or shipping requirements. Fulfilling partial orders is not required, if the stock is not available to fulfil an order, then order should not be processed. We don't expect that your changes to be persisted between runs.

Test Cases
----------
Given I have an order awaiting fulfilment
And the order has "product" included
And stock is available to fulfil that order
When I submit the fulfilment
Then I expect the order to be processed
And I expect that the order status is "Fulfilled"
And I expect that product quantity is updated 

...
