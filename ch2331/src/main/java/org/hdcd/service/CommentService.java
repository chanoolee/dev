package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Comment;

public interface CommentService {
	
	public List<Comment> list(Long BoardNo) throws Exception;
	public void addComment(Comment comment) throws Exception;

}
