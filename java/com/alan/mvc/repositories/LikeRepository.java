package com.alan.mvc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alan.mvc.models.Like;
@Repository
public interface LikeRepository extends CrudRepository<Like, Long> {

	List<Like> findAll();

	
}
