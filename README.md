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

**Key Design Decisions:**

| Entity Name | Why Entity is Included | Entities' Relationships |
| :---- | :---- | :---- |
| **Product** | Record of product information including name, description, category, etc. are necessary for the store to operate. | Products are stored in a warehouse, and stock levels are tracked to support inventory management, ensuring real-time monitoring of availability and preventing shortages. |
| **Order** | The Order entity tracks information on each customer’s order after purchase and connects with customer purchases as well as inventory information. | An order is linked to one transaction.  |
| **Transaction** | Transaction information is stored to track each transaction individually and connect that information with the inventory stock as well as customer order information. | Transaction is linked with customer and order. One order has one transaction, and one customer has one transaction at a time.  |
| **Shipment** | Shipment information is necessary to store and recall order details. | Shipment is linked with orderitem. An order can be on multiple shipments depending on how many order items are part of the order. |
| **OrderItem** | Intermediate table stores product quantity and pricing, allowing more detailed tracking of shipment of orders. | OrderItem is linked with order where one order can have multiple order items, and it also linked with product, where one product can be on multiple order items.  |
| **CartItem**  | Associative entity to meet normalization rules, specifically between the Cart and Product entities. | Cart and CartItem entities allow customers to add multiple items before completing a purchase, making the shopping experience more dynamic and flexible. |
| **Product Category** | All types of category of products. | It’s related to product table. |
| **Warehouse** | Keeps track of physical product storage, ensuring inventory is distributed properly. | Warehouses store products and are linked through inventory tracking to prevent stockouts and optimize logistics. |
| **Customer** | Stores customer details such as name, email, and contact information, essential for order tracking and personalized customer experiences. | A customer is linked to multiple orders, reviews, and transactions. |
| **Cart** | Temporary storage for products a customer selects before purchase, providing flexibility during the shopping process. | Linked to CartItems, allowing customers to modify item quantities. The cart is converted into an order upon checkout. |
| **Reviews** | Captures customer feedback and ratings for products, improving the customer shopping experience and product development. | Reviews are linked to both customers and products. One customer can leave multiple reviews, and each review is tied to a specific product. |
| **Warehouse Inventory** | Connects warehouse and product entity | Tracks the stock levels of each product at a specific warehouse, ensuring accurate inventory management and product availability across locations. It helps monitor stock distribution and replenishment needs. |

## About
A collaborative effort by  Elisheba, Emily, Evan, Josh, Luna

