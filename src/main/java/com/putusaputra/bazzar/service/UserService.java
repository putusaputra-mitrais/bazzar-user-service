package com.putusaputra.bazzar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.putusaputra.bazzar.model.User;
import com.putusaputra.bazzar.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository repository;
    
    public List<User> findAll() {
        return (List<User>) this.repository.findAll();
    }
    
    public User findById(String userId) {
        return this.repository.findById(userId).orElse(null);
    }
    
    public User save(User user) {
        return this.repository.save(user);
    }
    
    public User update(User user) {
        return this.repository.save(user);
    }
    
    public void deleteById(String userId) {
        this.repository.deleteById(userId);
    }
}
