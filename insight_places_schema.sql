#Criando o Banco de Dados Insight Places
CREATE SCHEMA insight_places;

#Criando Tabelas
-- Criando Tabela Owner
CREATE TABLE owners (
	owner_id VARCHAR (255) NOT NULL,
    owner_name VARCHAR (255) NOT NULL,
    tax_id VARCHAR (20) UNIQUE NOT NULL,
    contact VARCHAR (255),
    PRIMARY KEY (owner_id)

);

-- Criando Tabela Customers
CREATE TABLE customers (
	customer_id VARCHAR (255) NOT NULL,
    customer_name VARCHAR (255) NOT NULL,
    customer_tax_id VARCHAR (20) UNIQUE NOT NULL,
    contact VARCHAR (255),
    PRIMARY KEY (customer_id)

);

-- Criando Tabela Addresses
CREATE TABLE addresses (
	address_id VARCHAR (255) NOT NULL,
    street VARCHAR (255) NOT NULL,
    house_number VARCHAR (255) NOT NULL,
    neighborhood VARCHAR (255),
    city VARCHAR (255) NOT NULL,
    state VARCHAR (50) NOT NULL,
    zip_code VARCHAR (10),
	PRIMARY KEY (address_id)
);

-- Criando Tabela Listings
CREATE TABLE listings ( 
	listing_id VARCHAR (255) NOT NULL,
    property_type VARCHAR (255) NOT NULL,
    address_id VARCHAR (255) NOT NULL,
    owner_id VARCHAR (255) NOT NULL,
    is_active BOOL,
    PRIMARY KEY (listing_id),
    FOREIGN KEY (address_id) REFERENCES addresses (address_id),
    FOREIGN KEY (owner_id) REFERENCES owners (owner_id)
);
    
-- Criando Tabela Bookings
CREATE TABLE bookings (
	booking_id VARCHAR (255) NOT NULL,
    customer_id VARCHAR (255) NOT NULL,
    listing_id VARCHAR (255) NOT NULL,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL (10,2),
    PRIMARY KEY (booking_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (listing_id) REFERENCES listings (listing_id)
);

-- Criando Tabela Reviews
CREATE TABLE reviews (
	review_id VARCHAR (255),
    listing_id VARCHAR (255) NOT NULL,
    customer_id VARCHAR (255) NOT NULL,
    rating INT,
    review_text TEXT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (listing_id) REFERENCES listings (listing_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);