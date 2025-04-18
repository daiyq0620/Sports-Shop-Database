# Sports-Shop-Database

**Description of Business Problems:**   
Five Star Athletics is an online sports retailer specializing in high-quality athletic gear, apparel, and equipment. To remain competitive and meet growing customer expectations, the business requires a robust and scalable database system to manage its inventory, streamline order processing, track customer interactions, track shipments, and ensure efficient logistics and payment processing. The database must support and enhance the following areas:

* **Inventory Management:** Track stock levels, product locations, and manufacturer details across multiple warehouses, ensuring timely restocking and preventing shortages.  
* **Order and Shipment Tracking:** Provide real-time tracking of customer orders, linking them to shipping and delivery statuses for enhanced customer satisfaction and logistics optimization.  
* **Product Reviews and Ratings:** Enable customers to leave reviews and ratings for purchased products, helping Five Star Athletics gather feedback to improve the online shopping experience and inform future product offerings.				

**Design Requirements:**

The database will consist of 12 entities, ensuring comprehensive data storage, retrieval, and reporting capabilities while maintaining the Third Normal Form (3NF). Below are the core entities and their relationships:

**All Entities:**

1. **Product:** Stores product details such as productID, name, description, unit price  
2. **Product Category**: Organizes product offerings into categories, and links to Product entity.  
3. **Warehouse**: Details of warehouse locations.  
4. **Warehouse Inventory**: An associative table keeps track of product warehouse inventory  
5. **Cart**: Represents a shopping cart associated with a customer.  
6. **CartItem**: Links products to a cart, indicating the quantity and selected variations.  
7. **Order**: Stores details of customer purchases, including order status and date.  
8. **OrderItem**: Links products to orders, tracking quantity and price per item.  
9. **Customer**: Stores customer details such as name, email.  
10. **Transaction**: Stores payment details, linking orders to payment transactions.  
11. **Shipment**: Tracks order deliveries, linking orders to shipping details.  
12. **Reviews:** Stores customer reviews and ratings.  
    

**Business Rules:**

**ERD Product-Related Entities**

* Each **product** can have multiple reviews, and each review is linked to one product. (One to many).   
* Each **product** belongs to a single **category**, while each category can contain multiple products. (One-to-Many)  
* Each **cart** can have multiple cart items, and each cart item is linked to a specific product and quantity. (One-to-Many: Cart → Cart Item, One-to-Many: Product → Cart Item)  
* Each **Warehouse Inventory** record tracks the stock levels of a specific product at a specific warehouse. A warehouse can manage multiple inventory records, and each product can be stocked in multiple warehouses.(One-to-Many: Warehouse → Warehouse Inventory, One-to-Many: Product → Warehouse Inventory)

**ERD Order-Related Entities**

* One **order** can have multiple order items. (One to many)  
* Each **order item** is associated with exactly one product, but an order item can contain multiple units of that product. (Many to one)  
* Each **order** has exactly one transaction. (One to one)  
* Each **order** includes multiple order items, and each **shipment** can contain multiple order items from the same order. This allows products from a single order to be shipped in separate packages when needed.(One-to-Many: Order → Order Item, One-to-Many: Shipment → Order Item)

**ERD Customer-Related Entities**

* One **customer** can place several orders, make several transactions, and make several reviews.  (One to many relationships).  
* A **customer** can leave several reviews, but each review is associated with only one customer. (One to many)  
* One **customer** can place multiple orders, but each order is linked to only one customer. (One to many).  
* Each **customer** can have one active cart, which contains selected items before checkout. (One-to-one)

## About
A collaborative effort by  Elisheba, Emily, Evan, Josh, Luna

