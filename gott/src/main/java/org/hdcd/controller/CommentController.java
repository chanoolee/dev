package org.hdcd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.domain.Comment;
import org.hdcd.service.CommentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	private final CommentService service;
	

    public CommentController(CommentService service) {
        this.service = service;
    }
	
	@ResponseBody
	@GetMapping("/list")
	public List<Comment> list(Long boardNo) throws Exception {
		
		List<Comment> commentList = service.list(boardNo);
		System.out.println("commentList = " + commentList.toString());
		System.out.println("boardNo = " + boardNo);
		return commentList;
	}
	
	@PostMapping("/addComment")
	@PreAuthorize("hasRole('MEMBER')")
	public ResponseEntity<Comment> addComment(@RequestBody Comment comment, BindingResult result, HttpServletRequest request, Model model) throws Exception {
		
		String ajaxHeader = request.getHeader("X-Ajax-call");
		model.addAttribute("ajaxHeader", ajaxHeader);
		
		service.addComment(comment);
		
		System.out.println("commentId = " + comment.getUserId());
		System.out.println("commentContent = " + comment.getCommContent());
		
		ResponseEntity<Comment> entity = new ResponseEntity<Comment>(HttpStatus.OK);
		
		return entity;
		
	}
	

}
