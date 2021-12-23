package com.alan.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alan.mvc.models.Comment;
import com.alan.mvc.repositories.CommentRepository;


@Service
public class CommentService {
//	----------------DEPENDENCY INJECTION----------------
	private final CommentRepository commentRepo;
	public CommentService(CommentRepository commentRepo) {
		this.commentRepo = commentRepo;
	}
	
// return all comments
	public List<Comment> allcomments(){
		return commentRepo.findAll();
	}
	
//	create an comment
	public Comment creatComment(Comment c) {
		return commentRepo.save(c);
	}
	
//	retrieve a comment
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepo.findById(id);
		if(optionalComment.isPresent()) {
			return optionalComment.get();
		}else {
			return null;
		}
	}
	
//	update a comment
	public Comment updateComment(Comment c) {
		return commentRepo.save(c);
	}
	
//	delete comment by id
	public void deleteComment(Long id) {
		commentRepo.deleteById(id);
	}

}
	
	
	
	

