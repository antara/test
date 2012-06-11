package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 24, 2012
 * Time: 12:15:14 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class StoreIssueDetails {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne()
    @JoinColumn(name="item_id",nullable = false)
    private Item item;

    @Column(name = "requisition_quantity")
    private double requisitionQuantity;

    @Column(name = "issue_quantity")
    private double issueQuantity;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public double getRequisitionQuantity() {
        return requisitionQuantity;
    }

    public void setRequisitionQuantity(double requisitionQuantity) {
        this.requisitionQuantity = requisitionQuantity;
    }

    public double getIssueQuantity() {
        return issueQuantity;
    }

    public void setIssueQuantity(double issueQuantity) {
        this.issueQuantity = issueQuantity;
    }

    @Override
    public String toString() {
        return "StoreIssueDetails{" +
                "id=" + id +
                ", item=" + item +
                ", requisitionQuantity=" + requisitionQuantity +
                ", issueQuantity=" + issueQuantity +
                '}';
    }
}
