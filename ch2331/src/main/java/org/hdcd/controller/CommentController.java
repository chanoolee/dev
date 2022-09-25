package org.hdcd.controller;

import java.util.List;

import org.hdcd.domain.Comment;
import org.hdcd.service.CommentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	private final CommentService service;
	

    public CommentController(CommentService service) {
        this.service = service;
    }
	
	@ResponseBody
	@GetMapping("/list")
	@PreAuthorize("hasRole('MEMBER')")
	public List<Comment> list(Long boardNo) throws Exception {
		
		List<Comment> commentList = service.list(boardNo);
		System.out.println("commentList = " + commentList.toString());
		System.out.println("boardNo = " + boardNo);
		return commentList;
	}
	
	@PostMapping("/addComment")
	@PreAuthorize("hasRole('MEMBER')")
	public void addComment(@RequestBody Comment comment, RedirectAttributes rttr) throws Exception {
		
		service.addComment(comment);
		
		System.out.println("commentId = " + comment.getUserId());
		System.out.println("commentContent = " + comment.getCommContent());
		
		
	}
	

}
