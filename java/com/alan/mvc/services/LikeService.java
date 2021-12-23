package com.alan.mvc.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alan.mvc.models.Like;
import com.alan.mvc.repositories.LikeRepository;

@Service
public class LikeService {
	
	private final LikeRepository likeRepo;
	public LikeService(LikeRepository likeRepo) {
		this.likeRepo = likeRepo;
	}
	// return all comments
		public List<Like> allLikes(){
			return likeRepo.findAll();
		}
	
//	make like
	public Like like(Like l ) {
		return likeRepo.save(l);
	}
	
//	delete like
	public void unLike(Long id) {
		likeRepo.deleteById(id);
	}
}
