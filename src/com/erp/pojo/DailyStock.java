package com.erp.pojo;

import javax.persistence.Entity;
import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 24, 2012
 * Time: 10:15:53 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "daily_stock")
public class DailyStock {
     @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToMany()
    @JoinColumn(name="item_id",nullable = false)
    private Item item_id;
    @Column(name = "open_quantity")
    private double openQuantity;
    @Column(name = "received_quantity")
    private double receivedQuantity;
    @Column(name = "closing_quantity")
    private double closingQuantity;
    @Column(name = "remark")
    private String remark;
    @Column(name = "Date")
    private Date date;

    
    public Item getItem_id() {
        return item_id;
    }

    public void setItem_id(Item item_id) {
        this.item_id = item_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getOpenQuantity() {
        return openQuantity;
    }

    public void setOpenQuantity(double openQuantity) {
        this.openQuantity = openQuantity;
    }

    public double getReceivedQuantity() {
        return receivedQuantity;
    }

    public void setReceivedQuantity(double receivedQuantity) {
        this.receivedQuantity = receivedQuantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getClosingQuantity() {
        return closingQuantity;
    }

    public void setClosingQuantity(double closingQuantity) {
        this.closingQuantity = closingQuantity;
    }
}
