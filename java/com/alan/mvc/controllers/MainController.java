package com.alan.mvc.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alan.mvc.models.Comment;
import com.alan.mvc.models.Like;
import com.alan.mvc.models.LoginUser;
import com.alan.mvc.models.User;
import com.alan.mvc.services.ApiService;
import com.alan.mvc.services.CommentService;
import com.alan.mvc.services.LikeService;
import com.alan.mvc.services.UserService;





@Controller
public class MainController {
	
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private CommentService comServ;
	
	@Autowired
	private ApiService apiServ;
	
	@Autowired
	private LikeService likeServ;
	
	
	
//---------------------------------------loginPage------------------------------------------
	   @GetMapping("/")
	    public String index(Model model) {
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	   
//---------------------------------register Method-------------------------------------------
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        userServ.register(newUser, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new LoginUser());
	            return "register.jsp";
	        }
	        session.setAttribute("user_id", newUser.getId());
	        return "redirect:/home";
	    }
//------------------------------------------login Method-------------------------------------------
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        User user = userServ.login(newLogin, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", user.getId());
	        return "redirect:/home";
	    }
//--------------------------------------logging out-------------------------------------
		  @GetMapping("/logout")
		  public String logout(HttpSession session) {
		  	session.invalidate();
		  	return "redirect:/";
		  }
//------------------------------------ register Page-----------------------------------------
		  
		  @GetMapping("/letsRegister")
		  public String register(Model model) {
			  	model.addAttribute("newUser", new User());
		        model.addAttribute("newLogin", new LoginUser());
			   return "register.jsp";
		  }
//-------------------------------HomeView-----------------------------------
		  @GetMapping("/home")
		  public String home(HttpSession session, Model model) {
		  	Long userId =(Long) session.getAttribute("user_id");
		  	if(userId == null) {
		  		return "redirect:/";
		     	}else {
		     		User currentUser = userServ.findOne(userId);
		     		model.addAttribute("user",currentUser);
		     		return "home.jsp";
		     		
		     	}
		  }
		  
		  
		  
//API------------------------------getting in to New view with API data-----------------------
		  @GetMapping("/new/{platform}")
		  public String newest(HttpSession session, Model model,@PathVariable("platform") String platform) {
		  	Long userId =(Long) session.getAttribute("user_id");
		  	if(userId == null) {
		  		return "redirect:/";
		     	}else {
		     		List<Object> gameList = apiServ.getNewGames(platform);
					model.addAttribute("games", gameList);
					model.addAttribute("platform",platform.toUpperCase());
		     		User currentUser = userServ.findOne(userId);
		     		model.addAttribute("user",currentUser);
		     		return "new.jsp";
		     	}
		  }
//-------------------------------------newest drop down selector-----------------------
		  @PostMapping("/new")
			public String newestPicker(@RequestParam("newest") String words) {
				return"redirect:/new/"+words;
			}
		  
//API---------------------------  getting in to best games with API data-----------------------
		  @GetMapping("/best/{platform}")
		  public String bestGames(HttpSession session, Model model,@PathVariable("platform") String platform) {
		  	Long userId =(Long) session.getAttribute("user_id");
		  	if(userId == null) {
		  		return "redirect:/";
		     	}else {
				   	List<Object> gameList = apiServ.getBestGames(platform);
					model.addAttribute("games", gameList);
					model.addAttribute("platform",platform.toUpperCase());
		     		User currentUser = userServ.findOne(userId);
		     		model.addAttribute("user",currentUser);
		     		return "bestgames.jsp";
		     	}
		  }
//------------------------------- best drop down selector----------------------------------------------------
		  @PostMapping("/bestgames")
			public String bestPicker(@RequestParam("best") String words) {
				return"redirect:/best/"+words;
			}
		  
//API----------------------------------getting one Game to show-------------------------------------
		@GetMapping("/game/{id}")
		public String oneGame(HttpSession session, Model model,@PathVariable("id") String id) {
			Long userId =(Long) session.getAttribute("user_id");
		  	if(userId == null) {
		  		return "redirect:/";
		     	}else {
		     		HashMap<String,Object> game = apiServ.getGameById(id);
		     		model.addAttribute("game", game);
		     		List<Object> reviews = apiServ.getCriticReviewById(id);
		     		model.addAttribute("reviews", reviews);
		     		User currentUser = userServ.findOne(userId);
		     		model.addAttribute("user",currentUser);
		     		return "game.jsp";
		     	}
		     }
//API-------------------------------------------Search Method----------------------------------
		@GetMapping(value="/search/{name}")
		public String search(HttpSession session, Model model,@PathVariable("name") String name) {
			Long userId =(Long) session.getAttribute("user_id");
		  	if(userId == null) {
		  		return "redirect:/";
		     	}else {
		     	String noSpace = name.replaceAll("\\s", "");
				List<Object> gameSearch = apiServ.searchForAGames(noSpace);
				model.addAttribute("games", gameSearch);
	     		User currentUser = userServ.findOne(userId);
	     		model.addAttribute("user",currentUser);
				return "search.jsp";
		}
	}
//----------------------------------------------Search Bar Router------------------------------	
		@PostMapping("/search")
		public String inputTaker(@RequestParam("gameSearch") String words) {
			if(words.isBlank()) {
				return "redirect:/home";
			}else {
			return"redirect:/search/"+words;
		}
	}
//		
		
//--------------------------------------------go to the Forum------------------------------------------
		@GetMapping("/forum")
		public String forum(HttpSession session, Model model,@ModelAttribute("like") Like like) {
			Long userId =(Long) session.getAttribute("user_id");
	    	if(userId == null) {
	    		return "redirect:/";
	       	}else {       	
	       		List <Comment> comments = comServ.allcomments();
	       		model.addAttribute("comments",comments);
	       		User currentUser = userServ.findOne(userId);
	       		model.addAttribute("user",currentUser);
	       		return "forum.jsp";
	       	}
			
		}
//----------------------------------------go to add a Comment view----------------------------------------------
		@RequestMapping("/addComment")
		public String addComment(HttpSession session, Model model,@ModelAttribute("comment") Comment comment ) {	
			Long userId =(Long) session.getAttribute("user_id");
		    User currentUser = userServ.findOne(userId);
		    if(userId == null) {
		    		return "redirect:/";
			} else {
				model.addAttribute("user",currentUser);
				return "addComment.jsp";
			}
		}
			
		
//---------------------------------------create the comment method for the user--------------------------------------	
		@RequestMapping(value="/createComment", method=RequestMethod.POST)
		 public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result ) {
			if(result.hasErrors()) {
	    		return "addComment.jsp";
	    	} else {
	       		comServ.creatComment(comment);
	    		return "redirect:/forum";
	    	}
	    }	
		
//-------------------------------------------edit comment view----------------------------------------------
		@RequestMapping("/{id}/editComment")
		 public String edit(HttpSession session, @PathVariable("id") Long id, Model model) {
			Long userId =(Long) session.getAttribute("user_id");
	    	User currentUser = userServ.findOne(userId);
	    	Comment comment = comServ.findComment(id);
	    	if(userId==null) {
	    		return "redirect:/";
	    	}else if(comment==null){
	    		return "redirect:/forum";
	    	}else if(userId != comment.getUser().getId()){
	    		return "redirect:/forum";
	    	}else{
        		model.addAttribute("user", currentUser);
               	model.addAttribute("comment", comment);
            	return "editComment.jsp";
        	}
    		
	    }
//---------------------------------------------------edit Comment method-----------------------------------------------
	    @RequestMapping(value="/{id}/edit" , method=RequestMethod.PUT)
	    public String editBook(@Valid @ModelAttribute("comment") Comment comment, BindingResult result) {
	    	if(result.hasErrors()) {
	    		return "edit.jsp";
	    	} else {
	       		comServ.updateComment(comment);
	       		return "redirect:/forum";
	    	}
	    }

//-------------------------------------------delete the Comment------------------------------------------------------------
	    @RequestMapping(value="/{id}/delete", method=RequestMethod.DELETE)
		 public String delete(@PathVariable("id") Long id) {
			 comServ.deleteComment(id);
			 return "redirect:/forum";
		 }
		
	    
//--------------------------like Method--------------------------------
	    @RequestMapping(value="/like", method=RequestMethod.POST)
		 public String createComment(@Valid @ModelAttribute("like") Like like) {
	    	likeServ.like(like);
	    	return"redirect:/forum";
	    	}
	    
//---------------unlike method-----------------------------
	    @RequestMapping(value="/{id}/unlike", method=RequestMethod.DELETE)
		 public String unlike(@PathVariable("id") Long id) {
			 likeServ.unLike(id);
			 return "redirect:/forum";
		 }
	    
	   
	    
	    
	   
	    	

}
