package com.phamtra.laptopshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;
    private double price;

    //order_id : long
    //order_id many - one order
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order; //ok

    //product_id: long
    //product_id many - one product
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
