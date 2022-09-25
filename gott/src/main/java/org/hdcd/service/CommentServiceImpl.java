package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Comment;
import org.hdcd.mapper.CommentMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {
	
	private final CommentMapper mapper;

	@Override
	public List<Comment> list(Long boardNo) throws Exception {
		return mapper.list(boardNo);
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		mapper.addComment(comment);
	}

}
