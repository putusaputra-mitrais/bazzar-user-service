package com.putusaputra.bazzar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "user")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "org.hibernate.id.UUIDGenerator")
    private String id;
    
    @Column(length = 50, nullable = false)
    private String name;
    
    @Column(length = 200)
    private String address;
    
    @Column(length = 100, nullable = false)
    @Email
    private String email;
    
    @Column(length = 20)
    @Pattern(regexp = "[0-9]+", message = "phone number must be numbers only")
    private String phoneNumber;
}
