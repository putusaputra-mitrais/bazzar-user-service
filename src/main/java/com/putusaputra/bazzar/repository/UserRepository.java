package com.putusaputra.bazzar.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.putusaputra.bazzar.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, String> {

}
