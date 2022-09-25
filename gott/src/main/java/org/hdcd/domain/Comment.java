package org.hdcd.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {

	private int commNo;
	private String userId;
	private int commParentNo;
	private String commContent;
	private LocalDateTime commDate;
	private Long boardNo;
	
}
