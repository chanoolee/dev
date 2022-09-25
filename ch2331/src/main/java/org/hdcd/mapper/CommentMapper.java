package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Comment;

public interface CommentMapper {
	
	public List<Comment> list(Long BoardNo) throws Exception;
	public void addComment(Comment comment) throws Exception;

}
