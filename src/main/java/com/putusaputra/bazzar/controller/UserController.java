package com.putusaputra.bazzar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.putusaputra.bazzar.dto.ResponseWrapper;
import com.putusaputra.bazzar.model.User;
import com.putusaputra.bazzar.service.GlobalUtil;
import com.putusaputra.bazzar.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/user")
@Slf4j
public class UserController {
    private static final String USER_DATA_MESSAGE = "User Data";
    private static final String USER_SAVE_SUCCESS_MESSAGE = "User Data saved successfully";
    private static final String USER_SAVE_FAILED_MESSAGE = "User Data save failed";
    private static final String USER_UPDATE_SUCCESS_MESSAGE = "User Data updated successfully";
    private static final String USER_UPDATE_FAILED_MESSAGE = "User Data update failed";
    private static final String USER_DELETE_SUCCESS_MESSAGE = "User Data deleted successfully";
    private static final String USER_DELETE_FAILED_MESSAGE = "User Data delete failed";
    
    @Autowired
    private UserService service;
    
    @GetMapping("/get-all")
    public ResponseEntity<ResponseWrapper> getAll() {
        List<User> response = null;
        ResponseWrapper responseMessage = null;
        List<String> errors = new ArrayList<>();
        
        response = this.service.findAll();
        responseMessage = GlobalUtil.createResponse(USER_DATA_MESSAGE, response, errors);
        
        return ResponseEntity.ok(responseMessage);
    }
    
    @GetMapping("/get-by-id")
    public ResponseEntity<ResponseWrapper> getById(@RequestParam("userId") String userId) {
        User response = null;
        ResponseWrapper responseMessage = null;
        List<String> errors = new ArrayList<>();
        
        response = this.service.findById(userId);
        responseMessage = GlobalUtil.createResponse(USER_DATA_MESSAGE, response, errors);
        
        return ResponseEntity.ok(responseMessage);
    }
    
    @PostMapping("/save")
    public ResponseEntity<ResponseWrapper> save(@Valid @RequestBody User user, BindingResult bindingResult) {
        User response = null;
        ResponseWrapper responseMessage = null;
        List<String> errors = new ArrayList<>();
        
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().stream().forEach(bindError -> errors.add(bindError.getDefaultMessage()));
            return ResponseEntity.ok(GlobalUtil.createResponse(USER_SAVE_FAILED_MESSAGE, response, errors));
        }
        
        try {
            response = this.service.save(user);
            responseMessage = GlobalUtil.createResponse(USER_SAVE_SUCCESS_MESSAGE, response, errors);
        } catch (Exception e) {
            errors.add(e.getMessage());
            responseMessage = GlobalUtil.createResponse(USER_SAVE_FAILED_MESSAGE, response, errors);
            log.error(null, e);
        }

        return ResponseEntity.ok(responseMessage);
    }
    
    @PutMapping("/update")
    public ResponseEntity<ResponseWrapper> update(@Valid @RequestBody User user, BindingResult bindingResult) {
        User response = null;
        ResponseWrapper responseMessage = null;
        List<String> errors = new ArrayList<>();
        
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().stream().forEach(bindError -> errors.add(bindError.getDefaultMessage()));
            return ResponseEntity.ok(GlobalUtil.createResponse(USER_UPDATE_FAILED_MESSAGE, response, errors));
        }
        
        try {
            response = this.service.update(user);
            responseMessage = GlobalUtil.createResponse(USER_UPDATE_SUCCESS_MESSAGE, response, errors);
        } catch (Exception e) {
            errors.add(e.getMessage());
            responseMessage = GlobalUtil.createResponse(USER_UPDATE_FAILED_MESSAGE, response, errors);
            log.error(null, e);
        }

        return ResponseEntity.ok(responseMessage);
    }
    
    @DeleteMapping("/delete")
    public ResponseEntity<ResponseWrapper> delete(@RequestParam("userId") String userId) {
        User response = null;
        ResponseWrapper responseMessage = null;
        List<String> errors = new ArrayList<>();

        try {
            this.service.deleteById(userId);
            responseMessage = GlobalUtil.createResponse(USER_DELETE_SUCCESS_MESSAGE, response, errors);
        } catch (Exception e) {
            errors.add(e.getMessage());
            responseMessage = GlobalUtil.createResponse(USER_DELETE_FAILED_MESSAGE, response, errors);
            log.error(null, e);
        }

        return ResponseEntity.ok(responseMessage);
    }
}
