package com.alan.mvc.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="likes")
public class Like {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	  @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "user_id")
	    private User user;
	  
	  @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "comment_id")
	    private Comment comment;
	  
	  public Like () {
	    	
	    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}
	  
	  
}
