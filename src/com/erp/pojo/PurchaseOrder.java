package com.erp.pojo;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;


/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Feb 29, 2012
 * Time: 3:37:14 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "purchase_order")
public class PurchaseOrder {
  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  @Column(name="generated_po")
  private  int generatedPO;
  @Column(name = "status")
  private String status;
  @Column(name = "purchase_order_no")
  private String purchaseOrderNo;
  @Column(name = "create_date")
  private Date createDate;
  @ManyToOne()
  @JoinColumn(name="vendor_id",nullable = false)
  private Vendor vendor;
  @OneToMany(cascade = CascadeType.ALL)
  @JoinTable(name = "purchase_order_has_purchasedetail",
  joinColumns = { @JoinColumn(name = "purchase_order_no") }, inverseJoinColumns = { @JoinColumn(name = "purchase_detail_id") })
  private List<PurchaseOrderDetail> purchasedetailarray = new ArrayList<PurchaseOrderDetail>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getGeneratedPO() {
        return generatedPO;
    }

    public void setGeneratedPO(int generatedPO) {
        this.generatedPO = generatedPO;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPurchaseOrderNo() {
        return purchaseOrderNo;
    }

    public void setPurchaseOrderNo(String purchaseOrderNo) {
        this.purchaseOrderNo = purchaseOrderNo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    public List<PurchaseOrderDetail> getPurchasedetailarray() {
        return purchasedetailarray;
    }

    public void setPurchasedetailarray(List<PurchaseOrderDetail> purchasedetailarray) {
        this.purchasedetailarray = purchasedetailarray;
    }
}
