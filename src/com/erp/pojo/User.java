package com.erp.pojo;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Milind
 * Date: Feb 9, 2012
 * Time: 10:54:52 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long user_id;
    private  int deleted;
     @Column(length = 60)
    private String username;

    @Column(length = 60)
    private String password;
      @ManyToOne()
        @JoinColumn(name="role_id")
    private Role role;


    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }



    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", deleted=" + deleted +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
